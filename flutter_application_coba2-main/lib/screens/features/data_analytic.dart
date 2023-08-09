import 'package:flutter/material.dart';

class DataAnalyticPage extends StatelessWidget {
  const DataAnalyticPage({super.key});

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
              'Analisis Data pada Aplikasi Decision Support System',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'Pada applikasi ini terdapat beberapa indikator yang dapat menentukan performa mesin dengan indikator yang diambil dari analisis key performance indikator. dengan data-data yang tersedia pihak manajemen dapat melakukan pengambilan keputusan yang lebih cepat dan akurat dikarenakan pengambilan dan pengelolaan data sudah dilakukan oleh sistem, sehingga manajemen dapat melakukan tugas yang lebih kompleks ',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
            Text(
              'Data yang ditampilkan pada aplikasi',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              '-Running time: pada data ini menampilkan data aktual dimana data tersebut merupakan data running time sebenarnya pada mesin, terdapat juga perbandingan data perbandingan waktu running time antara aktual dengan optimal yang sudah diinput melalui parameter ',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '- Cycle time: pada data ini menampilkan data aktual cycle time mesin dan perbandingan dengan cycle time target yang sudah diinput melalui parameter',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '- Kuantitas produksi: pada data ini menampilkan data aktual kuantitas yang dihasilkan oleh mesin dan data optimal yang dapat dihasilkan oleh mesin. dari kedua data tersebut dapat menampilkan presentase antara kuantitas aktual dengan kuantitas optimal dan juga dapat menampilkan presentase kuantitas aktual dengan kuantitas targer yang sudah diinput oleh parameter.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '-  Konsumsi energi: pada data ini menampilkan seberapa pengeluaran listrik yang harus dikeluarkan oleh pihak manajemen untuk menjalankan mesin.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '- Raw matterial: pada data ini menampilkan seberapa besar pengeluaran bahan baku yang harus dikeluarkan oleh pihak manajemen untuk mencetak kuantitas terproduksi',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '- Down time: pada data ini menampilkan data kerugian yang dialami disaat terjadinya down time',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            Text(
              '- BEP: pada data ini menampilkan data yang menunjukan nilai break even point per-produk yang dimana nilai tersebut tidak akan menghasilkan keuntungan maupun kerugian. pada data ini pun menampilkan BEP aktual yang dihasilkan oleh mesin dan BEP optimal yang dapat diraih oleh mesin.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
