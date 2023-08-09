import 'package:flutter/material.dart';

class BepPage extends StatelessWidget {
  const BepPage({super.key});

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
              'Apa itu Analisis Break Even Point',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'Analisi titik impas atau bisa disebut juga break even point merupakan suatu analisis yang dapat mentukan tingkat penjualan pada titik setimbang diantara untung rugi, dimana pada titik tersebut perusahaan tidak mengalami keuntungan maupun kerugian dengan memperhatikan pengeluaran produksi dan kuantitas produksi',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
            Text(
              'Manfaat Menggunakan Analisis Break Even Point',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              '- Alat perencanaan untuk menghasilkan laba',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '- Untuk mengetahui hubungan volume penjualan yang diproduksi, harga jual dan biaya-biaya yang dikeluarkan, sehingga laba rugi perusahaan akan diketahui.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '-  Untuk mengetahui jumlah penjualan minimum agar perusahaan tidak menderita rugi.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '- Sebagai bahan pertimbangan untuk menentukan harga jual',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '- Sebagai bahan atau dasar pertimbangan dalam pengambilan keputusan',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '- Menganalisa harga jual dan dampak perubahan biaya.',
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
              'Titik impas atau titik Break Even Point (BEP) ini berguna bagi manajemen dalam membuat keputusan bisnis, yaitu harus memproduksi atau menjual pada jumlah berapa sehingga perusahaan tidak mengalami kerugian. Sehingga manajemen tahu, apabila ingin jumlah keuntungan tertentu maka harus memproduksi atau dapat menjual suatu jumlah yang dihitung berdasarkan titik impas tersebut..',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
