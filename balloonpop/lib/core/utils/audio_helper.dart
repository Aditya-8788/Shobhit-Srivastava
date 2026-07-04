import 'package:audioplayers/audioplayers.dart';

class AudioHelper {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> playPopSound() async {
    try {
      await _player.play(
        AssetSource('audio/pop.mp3'),
      );
    } catch (e) {
      print('Sound error: $e');
    }
  }
}