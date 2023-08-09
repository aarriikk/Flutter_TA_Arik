import 'package:flutter/material.dart';

class OperateManualPage extends StatelessWidget {
  const OperateManualPage({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [Text('Operate Manual Page')],
        ),
      ),
    );
  }
}
