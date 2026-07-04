// import 'package:flutter/material.dart';

// class CameraPage extends StatelessWidget {
//   const CameraPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('Camera Page'),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../bloc/fruit_hunt_bloc.dart';
import '../bloc/fruit_hunt_event.dart';
import '../bloc/fruit_hunt_state.dart';
import '../widgets/camera_button.dart';
import '../widgets/detected_item_card.dart';
import '../widgets/star_reward_widget.dart';
import 'reward_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _cameraController;
  bool _isCameraReady = false;
  bool _isCapturing = false;
  File? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();

      if (cameras.isEmpty) return;

      _cameraController = CameraController(
        cameras.first,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await _cameraController!.initialize();

      if (!mounted) return;

      setState(() {
        _isCameraReady = true;
      });
    } catch (e) {
      debugPrint('Camera error: $e');
    }
  }

  Future<void> _captureImage() async {
    if (_cameraController == null ||
        !_cameraController!.value.isInitialized ||
        _isCapturing) {
      return;
    }

    try {
      setState(() {
        _isCapturing = true;
      });

      final image = await _cameraController!.takePicture();
      final imageFile = File(image.path);

      setState(() {
        _capturedImage = imageFile;
      });

      if (!mounted) return;

      context.read<FruitHuntBloc>().add(
            DetectFruitEvent(imageFile: imageFile),
          );
    } catch (e) {
      debugPrint('Capture error: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isCapturing = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FruitHuntBloc, FruitHuntState>(
      listener: (context, state) {
        if (state is FruitHuntCompleted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => RewardPage(score: state.score),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text(AppStrings.appName),
          centerTitle: true,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<FruitHuntBloc, FruitHuntState>(
          builder: (context, state) {
            final score = state is FruitHuntLoaded
                ? state.score
                : state is FruitHuntCompleted
                    ? state.score
                    : 0;

            return Column(
              children: [
                const SizedBox(height: 12),

                StarRewardWidget(score: score),

                const SizedBox(height: 12),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: _capturedImage != null
                      ? Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.file(
                              _capturedImage!,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 16,
                              right: 16,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    _capturedImage = null;
                                  });
                                },
                                icon: const Icon(Icons.camera_alt),
                                label: const Text("Take Another"),
                              ),
                            ),
                          ],
                        )
                        : _isCameraReady
                          ? CameraPreview(_cameraController!)
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),

                if (state is FruitHuntLoading)
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: CircularProgressIndicator(),
                  ),

                if (state is FruitHuntLoaded &&
                    state.detectedItem != null)
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: DetectedItemCard(
                      detectedItem: state.detectedItem!,
                      message: state.message,
                    ),
                  ),

                Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: CameraButton(
                      onTap: () {
                        if (_capturedImage != null) {
                          setState(() {
                            _capturedImage = null;
                          });
                        } else {
                          _captureImage();
                        }
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}