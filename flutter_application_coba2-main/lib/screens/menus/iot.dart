import 'package:flutter/material.dart';

class IotPage extends StatelessWidget {
  const IotPage({super.key});

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
              'Apa itu Internet of Things',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'IoT adalah singkatan dari Internet of Things, istilah tersebut semakin banyak didengar setelah Revolusi Industri 4.0 digaungkan oleh pemerintah. Di dalam Revolusi Industri 4.0 ini adalah penerapan IoT di berbagai bidang tanpa terkecuali di bidang industri. Pertumbuhan Internet of Things (IoT) dengan cepat membentuk dunia yang lebih canggih. Perangkat pintar, koneksi internet, dan analitik data bertanggung jawab atas kemajuan revolusioner dalam bidang perdagangan, pertanian, maupun industri. Teknologi IoT telah memainkan peran penting dalam Industri, memberikan tingkat efisiensi operasional dan ketersediaan sumber daya yang tak terbayangkan. Dalam bidang industri, teknologi IoT didefinisikan sebagai jaringan perangkat, mesin, dan sensor yang terhubung satu sama lain dan ke Internet, dengan tujuan mengumpulkan data dan menganalisisnya untuk menerapkan informasi dalam perbaikan proses yang berkelanjutan.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
            Text(
              'Manfaat Menggunakan Internet of Things',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              '-  Manajemen dan pemantauan peralatan otomatis dan jarak jauh',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '-  Kontrol kualitas',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '-  Meningkatkan produktivitas',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '-  Kemampuan baru untuk memprediksi dan bertindak',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
