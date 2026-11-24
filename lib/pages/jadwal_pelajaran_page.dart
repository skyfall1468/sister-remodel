import 'package:flutter/material.dart';
import '../widgets/sister_theme.dart';
import '../widgets/sister_widgets.dart';

class JadwalPelajaranPage extends StatelessWidget {
  const JadwalPelajaranPage({super.key});
  @override
  Widget build(BuildContext context) {
    final jadwal = {
      'Senin': [
        ('07.00 - 08.30', 'RPL'),
        ('08.30 - 10.00', 'Matematika'),
        ('10.15 - 11.45', 'Bahasa Indonesia')
      ],
      'Selasa': [
        ('07.00 - 08.30', 'Basis Data'),
        ('08.30 - 10.00', 'Bahasa Inggris'),
        ('10.15 - 11.45', 'Pendidikan Pancasila')
      ],
      'Rabu': [
        ('07.00 - 08.30', 'Pemrograman Web'),
        ('08.30 - 10.00', 'Pendidikan Agama'),
        ('10.15 - 11.45', 'PJOK')
      ],
      'Kamis': [
        ('07.00 - 08.30', 'RPL'),
        ('08.30 - 10.00', 'Sejarah'),
        ('10.15 - 11.45', 'Matematika')
      ],
      'Jumat': [
        ('07.00 - 08.30', 'Bahasa Indonesia'),
        ('08.30 - 10.00', 'Projek Kreatif')
      ],
    };
    return Scaffold(
        appBar: AppBar(title: const Text('Jadwal Pelajaran')),
        body: ListView(padding: const EdgeInsets.all(20), children: [
          const SisterHeader(
              title: 'Jadwal XI RPL',
              subtitle:
                  'Contoh jadwal pelajaran mingguan. Sesuaikan dengan jadwal sekolah.'),
          const SizedBox(height: 18),
          ...jadwal.entries.map((day) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: SisterCard(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(day.key,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              color: SisterColors.navy,
                              fontSize: 17)),
                      const Divider(height: 20),
                      ...day.value.map((lesson) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Row(children: [
                              const Icon(Icons.access_time_rounded,
                                  size: 17, color: SisterColors.blue),
                              const SizedBox(width: 8),
                              SizedBox(
                                  width: 112,
                                  child: Text(lesson.$1,
                                      style: const TextStyle(
                                          color: SisterColors.muted,
                                          fontSize: 12))),
                              Expanded(
                                  child: Text(lesson.$2,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: SisterColors.ink))),
                            ]),
                          )),
                    ])),
              )),
        ]));
  }
}
