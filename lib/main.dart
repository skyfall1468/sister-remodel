import 'package:flutter/material.dart';
import 'pages/pilih_peran_page.dart';
import 'pages/login_siswa_page.dart';
import 'pages/dashboard_siswa_page.dart';
import 'pages/presensi_wajah_page.dart';
import 'pages/riwayat_absensi_page.dart';
import 'pages/pengajuan_izin_page.dart';
import 'pages/jadwal_pelajaran_page.dart';
import 'widgets/sister_theme.dart';

void main() => runApp(const SisterApp());

class SisterApp extends StatelessWidget {
  const SisterApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'SISTER Absensi',
        debugShowCheckedModeBanner: false,
        theme: SisterTheme.light,
        initialRoute: '/',
        routes: {
          '/': (_) => const PilihPeranPage(),
          '/login-siswa': (_) => const LoginSiswaPage(),
          '/dashboard-siswa': (_) => const DashboardSiswaPage(),
          '/presensi-wajah': (_) => const PresensiWajahPage(),
          '/riwayat-absensi': (_) => const RiwayatAbsensiPage(),
          '/pengajuan-izin': (_) => const PengajuanIzinPage(),
          '/jadwal-pelajaran': (_) => const JadwalPelajaranPage(),
        },
      );
}
