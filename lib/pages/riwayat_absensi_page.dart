import 'package:flutter/material.dart';
import '../widgets/sister_theme.dart';
import '../widgets/sister_widgets.dart';

class RiwayatAbsensiPage extends StatelessWidget {
  const RiwayatAbsensiPage({super.key});
  @override
  Widget build(BuildContext context) {
    final data = [
      ('Senin, 23 November 2026', 'Hadir', '07.05'),
      ('Jumat, 20 November 2026', 'Hadir', '06.58'),
      ('Kamis, 19 November 2026', 'Izin', '-'),
      ('Rabu, 18 November 2026', 'Hadir', '07.02'),
    ];
    return Scaffold(
        appBar: AppBar(title: const Text('Riwayat Absensi')),
        body: ListView(padding: const EdgeInsets.all(20), children: [
          const SisterHeader(
              title: 'Riwayat Absensi',
              subtitle:
                  'Daftar presensi siswa. Data berikut merupakan contoh tampilan.'),
          const SizedBox(height: 18),
          ...data.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SisterCard(
                    child: Row(children: [
                  const Icon(Icons.calendar_today_rounded,
                      color: SisterColors.blue),
                  const SizedBox(width: 12),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(item.$1,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: SisterColors.ink)),
                        const SizedBox(height: 4),
                        Text('Waktu: ${item.$3}',
                            style: const TextStyle(
                                color: SisterColors.muted, fontSize: 12)),
                      ])),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                          color: item.$2 == 'Hadir'
                              ? const Color(0xFFE3F5F1)
                              : const Color(0xFFFFF1D9),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(item.$2,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: item.$2 == 'Hadir'
                                  ? SisterColors.teal
                                  : Colors.orange.shade800))),
                ])),
              )),
        ]));
  }
}
