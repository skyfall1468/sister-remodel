import 'package:flutter/material.dart';
import '../widgets/sister_widgets.dart';

class PengajuanIzinPage extends StatefulWidget {
  const PengajuanIzinPage({super.key});
  @override
  State<PengajuanIzinPage> createState() => _PengajuanIzinPageState();
}

class _PengajuanIzinPageState extends State<PengajuanIzinPage> {
  final _formKey = GlobalKey<FormState>();
  final _alasan = TextEditingController();
  String _jenis = 'Izin';
  DateTime? _tanggal;

  @override
  void dispose() {
    _alasan.dispose();
    super.dispose();
  }

  Future<void> _pilihTanggal() async {
    final result = await showDatePicker(
        context: context,
        firstDate: DateTime(2024),
        lastDate: DateTime(2030),
        initialDate: DateTime.now());
    if (result != null) setState(() => _tanggal = result);
  }

  void _kirim() {
    if (!_formKey.currentState!.validate() || _tanggal == null) {
      sisterMessage(context, 'Lengkapi tanggal dan alasan pengajuan.');
      return;
    }
    sisterMessage(context, 'Pengajuan $_jenis berhasil.');
    _alasan.clear();
    setState(() {
      _tanggal = null;
      _jenis = 'Izin';
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Pengajuan Izin')),
        body: ListView(padding: const EdgeInsets.all(20), children: [
          const SisterHeader(
              title: 'Form Pengajuan',
              subtitle: 'Isi data pengajuan izin atau sakit.'),
          const SizedBox(height: 20),
          Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Jenis Pengajuan',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                        value: _jenis,
                        items: const [
                          DropdownMenuItem(value: 'Izin', child: Text('Izin')),
                          DropdownMenuItem(
                              value: 'Sakit', child: Text('Sakit')),
                        ],
                        onChanged: (v) => setState(() => _jenis = v ?? 'Izin')),
                    const SizedBox(height: 18),
                    const Text('Tanggal',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                        onPressed: _pilihTanggal,
                        icon: const Icon(Icons.calendar_month),
                        label: Text(_tanggal == null
                            ? 'Pilih tanggal'
                            : '${_tanggal!.day}/${_tanggal!.month}/${_tanggal!.year}')),
                    const SizedBox(height: 18),
                    const Text('Alasan',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    TextFormField(
                        controller: _alasan,
                        maxLines: 4,
                        decoration: const InputDecoration(
                            hintText: 'Tuliskan alasan pengajuan...'),
                        validator: (v) => v == null || v.trim().isEmpty
                            ? 'Alasan wajib diisi'
                            : null),
                    const SizedBox(height: 24),
                    SisterButton(
                        label: 'Kirim Pengajuan',
                        icon: Icons.send_rounded,
                        onPressed: _kirim),
                  ])),
        ]),
      );
}
