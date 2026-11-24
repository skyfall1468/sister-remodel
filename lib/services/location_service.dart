import 'package:location/location.dart';

class LocationService {
  LocationService({Location? location}) : _location = location ?? Location();
  final Location _location;

  Future<LocationData> getCurrentLocation() async {
    var serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        throw Exception('Layanan lokasi/GPS belum diaktifkan.');
      }
    }

    var permission = await _location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await _location.requestPermission();
    }
    if (permission == PermissionStatus.deniedForever) {
      throw Exception('Izin lokasi ditolak. Ubah izin melalui pengaturan perangkat.');
    }
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.grantedLimited) {
      throw Exception('Izin lokasi belum diberikan.');
    }
    return _location.getLocation();
  }
}
