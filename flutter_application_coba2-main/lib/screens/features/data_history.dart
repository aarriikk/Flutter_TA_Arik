import 'package:flutter/material.dart';

class DataHistoryPage extends StatelessWidget {
  const DataHistoryPage({super.key});

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
              'History Data pada Aplikasi Decision Support System',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'Pada aplikasi ini menampilkan rekaman data-data yang sudah terekam oleh sistem dengan isi data seeprti yang dijelaskan pada halaman data analytics. rekaman data dapat mempermudah pihak manajemen maupun pihak pengambil keputusan untuk mengambil keputusan berdasarkan data yang sudah terekam pada sistem. Pengambilan keputusan akan lebih akurat dikarenakan data dapat dibandingkan secara manual oleh pihak manajemen dan juga data tersebut diambil dari data raspi yang memiliki tingkat akurasi tinggi dan mengurangi resiko error data yang dihasilkan oleh human error ',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
