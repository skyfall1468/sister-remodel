import 'package:flutter/material.dart';
import '../widgets/sister_theme.dart';
import '../widgets/sister_widgets.dart';

class DashboardSiswaPage extends StatelessWidget {
  const DashboardSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final tanggal =
        '${_hari(now.weekday)}, ${now.day} ${_bulan(now.month)} ${now.year}';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda Siswa',
            style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          IconButton(
              tooltip: 'Keluar',
              icon: const Icon(Icons.logout_rounded),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/', (route) => false))
        ],
      ),
      body: SafeArea(
          child: ListView(padding: const EdgeInsets.all(20), children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [SisterColors.navy, SisterColors.blue]),
              borderRadius: BorderRadius.circular(20)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Selamat datang,',
                style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 5),
            const Text('Slamet Dwi Saputra',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            const Text('XI RPL', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 20),
            Text(tanggal,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600)),
          ]),
        ),
        const SizedBox(height: 20),
        const SisterHeader(title: 'Presensi Hari Ini'),
        const SizedBox(height: 10),
        const SisterCard(
            child: Row(children: [
          Icon(Icons.error, color: Color(0xFFBC0000), size: 30),
          SizedBox(width: 12),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text('Belum melakukan presensi',
                    style: TextStyle(
                        fontWeight: FontWeight.w800, color: SisterColors.ink)),
                SizedBox(height: 3),
                Text('Lakukan presensi sesuai jadwal sekolah.',
                    style: TextStyle(color: SisterColors.muted, fontSize: 12)),
              ])),
        ])),
        const SizedBox(height: 22),
        const SisterHeader(title: 'Menu Siswa'),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.25,
          children: [
            _MenuTile(
                icon: Icons.face_retouching_natural_rounded,
                title: 'Presensi Wajah',
                onTap: () => Navigator.pushNamed(context, '/presensi-wajah')),
            _MenuTile(
                icon: Icons.history_rounded,
                title: 'Riwayat Absensi',
                onTap: () => Navigator.pushNamed(context, '/riwayat-absensi')),
            _MenuTile(
                icon: Icons.edit_document,
                title: 'Pengajuan Izin',
                onTap: () => Navigator.pushNamed(context, '/pengajuan-izin')),
            _MenuTile(
                icon: Icons.calendar_month_rounded,
                title: 'Jadwal Pelajaran',
                onTap: () => Navigator.pushNamed(context, '/jadwal-pelajaran')),
          ],
        ),
      ])),
    );
  }

  static String _hari(int n) =>
      ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'][n - 1];
  static String _bulan(int n) => [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
      ][n - 1];
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const _MenuTile(
      {required this.icon, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: SisterCard(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 34, color: SisterColors.blue),
          const SizedBox(height: 10),
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, color: SisterColors.navy)),
        ])),
      );
}
