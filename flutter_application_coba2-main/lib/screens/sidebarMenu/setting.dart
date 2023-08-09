import 'package:flutter/material.dart';
import 'package:my_app/components/sidebar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
      body: const Center(
        child: Text(
          'Setting Page',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
