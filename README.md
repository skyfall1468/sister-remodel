# SISTER Absensi - izin perangkat dan lokasi

## Fitur tambahan
- `permission_handler`: meminta izin kamera saat tombol **Minta Izin Kamera** ditekan.
- `location`: memeriksa layanan lokasi, meminta izin lokasi bila diperlukan, lalu membaca latitude, longitude, dan akurasi.
- Koordinat tampil pada halaman Presensi Wajah.

## Menjalankan
Buka folder proyek yang berisi `pubspec.yaml`, lalu jalankan:

```bash
flutter --version
flutter pub get
flutter run -d chrome
```

Untuk Android, jalankan `flutter run` setelah perangkat terdeteksi oleh `flutter devices`.

## Persyaratan
Package `location 10.2.0` dan `permission_handler 12.0.3` memerlukan Dart SDK 3.6 atau lebih baru. `permission_handler` memerlukan AndroidX dan compile SDK minimal 35. Proyek menggunakan nilai `flutter.compileSdkVersion`.

## Catatan
- Di Chrome, izinkan akses lokasi melalui dialog browser. Geolocation web biasanya memerlukan localhost atau HTTPS.
- Di Android, aktifkan GPS dan berikan izin saat diminta.
- Izin kamera sudah terhubung, tetapi pengambilan foto dan pengenalan wajah belum dibuat karena proyek awal belum memakai plugin kamera.
- Lokasi hanya diambil saat pengguna menekan tombol deteksi, bukan dilacak di latar belakang.
