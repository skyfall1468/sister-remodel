import 'package:flutter/material.dart';
import '../widgets/sister_theme.dart';
import '../widgets/sister_widgets.dart';

class LoginSiswaPage extends StatefulWidget {
  const LoginSiswaPage({super.key});
  @override
  State<LoginSiswaPage> createState() => _LoginSiswaPageState();
}

class _LoginSiswaPageState extends State<LoginSiswaPage> {
  final _formKey = GlobalKey<FormState>();
  final _nis = TextEditingController();
  final _password = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _nis.dispose();
    _password.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.pushReplacementNamed(context, '/dashboard-siswa');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () => Navigator.pop(context))),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 28),
        child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SisterHeader(
                  title: 'Masuk sebagai Siswa',
                  subtitle:
                      'Gunakan NIS dan kata sandi yang diberikan sekolah.'),
              const SizedBox(height: 30),
              const Center(
                  child: Icon(Icons.account_circle_rounded,
                      size: 84, color: SisterColors.blue)),
              const SizedBox(height: 28),
              const Text('Nomor Induk Siswa (NIS)',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: SisterColors.ink)),
              const SizedBox(height: 8),
              TextFormField(
                  controller: _nis,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Masukkan NIS',
                      prefixIcon: Icon(Icons.badge_outlined)),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'NIS wajib diisi' : null),
              const SizedBox(height: 18),
              const Text('Kata Sandi',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: SisterColors.ink)),
              const SizedBox(height: 8),
              TextFormField(
                  controller: _password,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                      hintText: 'Masukkan kata sandi',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                          icon: Icon(_obscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () =>
                              setState(() => _obscure = !_obscure))),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Kata sandi wajib diisi' : null),
              const SizedBox(height: 28),
              SisterButton(
                  label: 'Masuk', onPressed: _login, icon: Icons.login_rounded),
              const SizedBox(height: 16),
            ])),
      )),
    );
  }
}
