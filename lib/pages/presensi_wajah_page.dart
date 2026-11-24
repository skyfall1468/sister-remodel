import 'package:flutter/material.dart';
import 'package:location/location.dart' show LocationData;
import 'package:permission_handler/permission_handler.dart';

import '../services/device_permission_service.dart';
import '../services/location_service.dart';
import '../widgets/sister_theme.dart';
import '../widgets/sister_widgets.dart';

class PresensiWajahPage extends StatefulWidget {
  const PresensiWajahPage({super.key});
  @override
  State<PresensiWajahPage> createState() => _PresensiWajahPageState();
}

class _PresensiWajahPageState extends State<PresensiWajahPage> {
  final DevicePermissionService _permissionService = DevicePermissionService();
  final LocationService _locationService = LocationService();
  bool _loadingCamera = false;
  bool _loadingLocation = false;
  PermissionStatus? _cameraStatus;
  LocationData? _locationData;
  String? _locationMessage;

  Future<void> _requestCameraPermission() async {
    setState(() => _loadingCamera = true);
    try {
      final status = await _permissionService.requestCameraPermission();
      if (!mounted) return;
      setState(() => _cameraStatus = status);
      if (status.isGranted) {
        _showMessage('Izin kamera berhasil diberikan.');
      } else if (status.isPermanentlyDenied) {
        _showMessage('Izin kamera ditolak . Aktifkan melalui pengaturan aplikasi.');
      } else {
        _showMessage('Izin kamera belum diberikan.');
      }
    } catch (e) {
      _showMessage('Gagal meminta izin kamera: $e');
    } finally {
      if (mounted) setState(() => _loadingCamera = false);
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() { _loadingLocation = true; _locationMessage = null; });
    try {
      final data = await _locationService.getCurrentLocation();
      if (!mounted) return;
      setState(() { _locationData = data; _locationMessage = 'Lokasi terdeteksi.'; });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _locationData = null;
        _locationMessage = e.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      if (mounted) setState(() => _loadingLocation = false);
    }
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  String get _cameraLabel {
    if (_cameraStatus == null) return 'Belum diperiksa';
    if (_cameraStatus!.isGranted) return 'Diizinkan';
    if (_cameraStatus!.isPermanentlyDenied) return 'Izin ditolak';
    if (_cameraStatus!.isDenied) return 'Belum diizinkan';
    return _cameraStatus!.name;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Presensi Wajah')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const SisterHeader(
        title: 'Verifikasi Wajah',
        subtitle: 'Periksa izin kamera dan lokasi sebelum presensi.',
      ),
      const SizedBox(height: 20),
      Container(
        height: 210,
        decoration: BoxDecoration(color: SisterColors.navy, borderRadius: BorderRadius.circular(22)),
        child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.face_retouching_natural_rounded, size: 88, color: Colors.white),
          SizedBox(height: 14),
          Text('Area kamera', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
          SizedBox(height: 6),
          Text('Tampilan kamera masih berupa placeholder', style: TextStyle(color: Colors.white70, fontSize: 12)),
        ]),
      ),
      const SizedBox(height: 18),
      SisterCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Izin Kamera', style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Row(children: [
          Icon(_cameraStatus?.isGranted == true ? Icons.check_circle : Icons.info_outline,
            color: _cameraStatus?.isGranted == true ? SisterColors.teal : SisterColors.muted),
          const SizedBox(width: 8), Expanded(child: Text('Status: $_cameraLabel')),
        ]),
        const SizedBox(height: 12),
        SisterButton(label: _loadingCamera ? 'Meminta izin...' : 'Minta Izin Kamera',
          icon: Icons.camera_alt_rounded, onPressed: _loadingCamera ? () {} : _requestCameraPermission),
      ])),
      const SizedBox(height: 14),
      SisterCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Deteksi Lokasi', style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        if (_locationData == null) const Text('Koordinat belum tersedia.') else ...[
          _LocationValue(label: 'Latitude', value: _locationData!.latitude?.toStringAsFixed(6) ?? 'Tidak tersedia'),
          const SizedBox(height: 6),
          _LocationValue(label: 'Longitude', value: _locationData!.longitude?.toStringAsFixed(6) ?? 'Tidak tersedia'),
          if (_locationData!.accuracy != null) ...[
            const SizedBox(height: 6),
            _LocationValue(label: 'Akurasi', value: '${_locationData!.accuracy!.toStringAsFixed(1)} meter'),
          ],
        ],
        if (_locationMessage != null) ...[
          const SizedBox(height: 8),
          Text(_locationMessage!, style: TextStyle(color: _locationData == null ? Colors.red.shade700 : SisterColors.teal)),
        ],
        const SizedBox(height: 12),
        SisterButton(label: _loadingLocation ? 'Mendeteksi lokasi...' : 'Deteksi Lokasi Sekarang',
          icon: Icons.my_location_rounded, onPressed: _loadingLocation ? () {} : _getCurrentLocation),
      ])),
    ]),
  );
}

class _LocationValue extends StatelessWidget {
  const _LocationValue({required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) => Row(children: [
    SizedBox(width: 88, child: Text(label, style: const TextStyle(color: SisterColors.muted))),
    Expanded(child: SelectableText(value, style: const TextStyle(fontWeight: FontWeight.w600))),
  ]);
}
