import 'package:flutter/material.dart';

class BottomNavbarComponent extends StatefulWidget {
  final Function(int) onIndexChanged;
  final int currentIndex;

  const BottomNavbarComponent(
      {Key? key, required this.currentIndex, required this.onIndexChanged})
      : super(key: key);

  @override
  State<BottomNavbarComponent> createState() => _BottomNavbarComponent();
}

class _BottomNavbarComponent extends State<BottomNavbarComponent> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: (index) => widget.onIndexChanged(index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 12, 12, 12)),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Record',
              backgroundColor: Color.fromARGB(255, 34, 34, 34)),
          BottomNavigationBarItem(
              icon: Icon(Icons.data_array),
              label: 'Parameter',
              backgroundColor: Color.fromARGB(255, 78, 78, 78)),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor),
              label: 'Monitoring',
              backgroundColor: Color.fromARGB(255, 78, 78, 78)),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.input),
          //     label: 'Manual',
          //     backgroundColor: Color.fromARGB(255, 85, 85, 85)),
        ]);
  }
}
