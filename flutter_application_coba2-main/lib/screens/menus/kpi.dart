import 'package:flutter/material.dart';

class KpiPage extends StatelessWidget {
  const KpiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          title: const Text("DSS APP"),
          centerTitle: true,
          elevation: 20),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Apa itu Key Performance Indicators',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'KPI yang merupakan singkatan dari key performance indicator adalah suatu matriks atau nilai terukur yang berfungsi untuk menunjukkan seberapa efektif perusahaan dalam mencapai tujuan bisnis utamanya. Selain itu, kehadiran KPI juga bermanfaat untuk membantu perusahaan merumuskan langkah apa saja yang diperlukan untuk mencapai tujuan tersebut.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
            Text(
              'Manfaat Menggunakan Matriks Key Performance indicators',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              '-  Mengukur hal-hal yang ingin diukur untuk membantu menentukan pengambilan keputusan yang lebih baik',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '-  Membantu melihat dengan jelas indikator keberhasilan atau kegagalan dalam bisnis',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '-  Berfungsi untuk mengukur sejauh mana bisnis kalian sudah berkembang, apakah menuju ke arah yang baik, atau justru sebaliknya.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
            Text(
              'Mengapa menggunakan Breaak even point',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              'KPI (Indikator Kinerja Utama) sangat penting untuk memantau kinerja dalam industri. KPI dapat digunakan untuk mengidentifikasi kinerja buruk dan potensi perbaikan. KPI dapat diperuntukan  untuk peralatan individu, subproses, dan seluruh pabrik. Berbagai jenis kinerja dapat diukur melalui KPI, misalnya energi, bahan baku, kontrol & operasi, pemeliharaan, dan lain sebagainya.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 3.0),
            Text(
              'Benchmarking menggunakan KPI pada peralatan dan pabrik serupa adalah salah satu metode untuk mengidentifikasi area yang performanya buruk dan memperkirakan potensi perbaikan. Tindakan untuk peningkatan kinerja kemudian dapat dikembangkan, diprioritaskan, dan diimplementasikan berdasarkan KPI dan hasil benchmarking.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
