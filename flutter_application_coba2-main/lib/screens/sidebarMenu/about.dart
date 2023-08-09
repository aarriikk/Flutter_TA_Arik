import 'package:flutter/material.dart';
import 'package:my_app/components/sidebar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarComponent(),
      appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          title: const Text("DSS APP"),
          centerTitle: true,
          elevation: 20),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome to our App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Applikasi ini dapat mempermudah anda sebagai manajemen dalam pengambilan keputusan dengan pemajian data-data yang diakusisi dan diproses secara otomasi oleh controller dan server. Sehingga anda hanya cukup melihat data-data yang sudah disajikan dalam applikasi ini. Applikasi ini dibuat oleh mahasiswa Politeknik Manufaktur Negeri Bandung sebagai syarat lulus Tugas Akhir',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8),
            Text(
              'Features utama pada applikasi ini adalah:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('- Penampilan data secara otomasi'),
            Text(
                '- Semua Data yang tesimpan pada Data Base dapat dilihat sebagai data record'),
            Text('- Terdapat penjelasan mengenai jenis data yang ditampilkan'),
            // Add more details about the app as needed
          ],
        ),
      ),
    );
  }
}
