import 'package:flutter/material.dart';
import 'package:my_app/components/sidebar.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

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
              'About the Author',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Arik Muhammad Ridwandaru merupakan pembuat applikasi Decision Support System ini sebagai syarat lulus Tugas Akhir, dengan NIM 219441032 dan tahun masuk 2019. Apabila memiliki pertanyaan mengenai applikasi yang saya buat maka dapat menghubungi kontak person dibawah ini.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8),
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('arikmr66@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+62 851-5530-1599'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('Jl. Kanayakan No 21, Kota Bandung, Jawa Barat'),
            ),
          ],
        ),
      ),
    );
  }
}
