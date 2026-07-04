// class CameraPermission {
//   const CameraPermission();

//   Future<bool> check() async => true;

//   Future<bool> request() async => true;
// }
import 'package:permission_handler/permission_handler.dart';

class CameraPermission {
  static Future<bool> requestPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  static Future<bool> isPermissionGranted() async {
    final status = await Permission.camera.status;
    return status.isGranted;
  }
}