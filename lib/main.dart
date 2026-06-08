import 'package:cakrawala_app/sesi4/belajar_state.dart';
import 'package:cakrawala_app/sesi5/checkout_page.dart';
import 'package:cakrawala_app/sesi5/product_detail_page.dart';
import 'package:cakrawala_app/sesi5/product_list_page.dart';
import 'package:cakrawala_app/sesi5/student_detail_page.dart';
import 'package:cakrawala_app/sesi5/student_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Flutter',

      // ─── DAFTAR SEMUA NAMED ROUTES ──────────────────────────────────
      // Setiap route punya nama (String) yang digunakan saat navigasi.
      // Cukup daftarkan widget-nya — argumen diterima langsung di dalam
      // widget via ModalRoute.of(context)!.settings.arguments
      initialRoute: '/student-list', // halaman pertama yang dibuka
      routes: {
        '/': (context) => const HalamanUtama(),
        '/product-list': (context) => ProductListPage(),
        '/product-detail': (context) => const ProductDetailPage(),
        '/checkout': (context) => const CheckoutPage(),
        '/student-list': (context) => StudentListPage(),
        '/student-detail': (context) => const StudentDetailPage(),
      },
      // ────────────────────────────────────────────────────────────────
    );
  }
  
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int counter = 0;
  String pesan = 'Belum ditekan';

  void tambah() {
    setState(() {
      counter++;
      pesan = 'Sudah ditekan $counter kali';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar State'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pesan,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: tambah,
              child: const Text('Tekan Saya'),
            ),
          ],
        ),
      ),
    );
  }
}