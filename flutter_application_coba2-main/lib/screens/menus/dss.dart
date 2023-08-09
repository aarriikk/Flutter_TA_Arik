import 'package:flutter/material.dart';

class DssPage extends StatelessWidget {
  const DssPage({super.key});

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Apa itu Decision Support System',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                'Decision support system (DSS) adalah sistem informasi berbasis komputer yang dirancang untuk membantu manajer dan analis dalam proses pengambilan keputusan melalui penggunaan teknologi perangkat lunak yang canggih. DSS menyediakan alat yang berguna dan mudah digunakan bagi para manajer dan pengambil keputusan yang tidak memiliki latar belakang dan keahlian dalam pemrograman dan pengembangan perangkat lunak.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'Manfaat sistem Decision Support System',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              Text(
                '- Kecepatan : Sistem pendukung keputusan memungkinkan pengguna untuk mengambil keputusan dengan cepat.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              Text(
                '- Cakupan kesalahan yang lebih rendah : data yang dimasukkan ke dalam sistem relevan dan akurat, sehingga data keluaran akan akurat.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              Text(
                '-  Otomatisasi : sistem ini dapat mengotomatiskan keputusan manajerial sederhana, memungkinkan staf untuk berkonsentrasi pada tugas tingkat yang lebih tinggi.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              Text(
                '- Efektivitas biaya : Metode tradisional untuk mengatur dan memproses data membutuhkan terlalu banyak tenaga kerja. Menggunakan DSS membutuhkan lebih sedikit sumber daya dan bahkan mengurangi biaya peluang yang akan timbul akibat penundaan yang disebabkan olehproses manual.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16.0),
              Text(
                'Mengapa menggunakan Decision Support System',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              Text(
                'Sesuai dengan penjelasan diatas, Decision Support System sangat dibutuhkan dalam suatu perusahaan karena dapat membantu pengambilan keputusan dengan lebih mudah, murah, cepat, dan akurat pada perusahaan anda. Selain itu penerapan sistem Decision Support System juga dapat memfokuskan pengerjaan pada hal yang lebih kompleks dikarenakan pekerjaan yang bersifat berulang sudah dilakukan oleh sistem yang mengakibatkan efektivitas meningkat dan menekan biaya dalam pekerjaan yang sudah dikerjakan oleh sistem.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
