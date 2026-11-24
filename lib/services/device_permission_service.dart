import 'package:permission_handler/permission_handler.dart';

class DevicePermissionService {
  Future<PermissionStatus> requestCameraPermission() {
    return Permission.camera.request();
  }
}
