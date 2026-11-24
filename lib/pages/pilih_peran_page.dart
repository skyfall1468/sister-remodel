import 'package:flutter/material.dart';
import '../widgets/sister_theme.dart';
import '../widgets/sister_widgets.dart';

class PilihPeranPage extends StatelessWidget {
  const PilihPeranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                        color: SisterColors.sky,
                        borderRadius: BorderRadius.circular(22)),
                    child: const Icon(Icons.school_rounded,
                        size: 42, color: SisterColors.blue),
                  ),
                ),
                const SizedBox(height: 22),
                const Center(
                    child: Text('SISTER',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: SisterColors.navy,
                            letterSpacing: 2))),
                const SizedBox(height: 6),
                const Center(
                    child: Text('Sistem Informasi Sekolah',
                        style: TextStyle(color: SisterColors.muted))),
                const SizedBox(height: 38),
                const SisterHeader(
                    title: 'Selamat Datang',
                    subtitle:
                        'Silakan pilih jenis akun untuk melanjutkan ke sistem presensi sekolah.'),
                const SizedBox(height: 20),
                _RoleTile(
                    icon: Icons.person_rounded,
                    title: 'Siswa',
                    subtitle: 'Akses presensi dan jadwal',
                    active: true,
                    onTap: () => Navigator.pushNamed(context, '/login-siswa')),
                const SizedBox(height: 12),
                const _RoleTile(
                    icon: Icons.cast_for_education_rounded,
                    title: 'Guru',
                    subtitle: 'Belum tersedia pada versi ini',
                    active: false),
                const SizedBox(height: 12),
                const _RoleTile(
                    icon: Icons.admin_panel_settings_rounded,
                    title: 'Admin',
                    subtitle: 'Belum tersedia pada versi ini',
                    active: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RoleTile extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final bool active;
  final VoidCallback? onTap;
  const _RoleTile(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.active,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: active ? 1 : .55,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: SisterCard(
          child: Row(children: [
            Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: SisterColors.sky,
                    borderRadius: BorderRadius.circular(14)),
                child: Icon(icon, color: SisterColors.blue, size: 27)),
            const SizedBox(width: 14),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: SisterColors.navy)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: const TextStyle(
                          color: SisterColors.muted, fontSize: 12)),
                ])),
            Icon(
                active
                    ? Icons.arrow_forward_ios_rounded
                    : Icons.lock_outline_rounded,
                size: 17,
                color: SisterColors.muted),
          ]),
        ),
      ),
    );
  }
}
