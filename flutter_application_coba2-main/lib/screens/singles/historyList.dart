import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/screens/singles/historySingle.dart';
import 'package:my_app/services/machineData_service.dart';
import 'package:my_app/utils/utils.dart';
import 'package:instant/instant.dart';

class HistoryListPage extends StatefulWidget {
  final int machineId;
  const HistoryListPage({super.key, required this.machineId});

  @override
  State<HistoryListPage> createState() => _HistoryListPageState();
}

class _HistoryListPageState extends State<HistoryListPage> {
  final machineDataService = MachineDataService();
  var _machines = [];

  @override
  void initState() {
    super.initState();
    _fetchMachines();
  }

  Future<void> _fetchMachines() async {
    try {
      final res = await machineDataService.getAllMachine(
          context: context, machineId: widget.machineId);
      final Map<String, dynamic> resData = json.decode(res.body);
      if (resData['status'] == 'success') {
        setState(() {
          _machines = resData['data'];
        });
      }
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          title: const Text("DSS APP"),
          centerTitle: true,
          elevation: 20),
      backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      body: ListView.builder(
        itemCount: _machines.length,
        itemBuilder: (context, index) {
          final machine = _machines[index];
          String createdAtString = machine[
              'createdAt']; // Replace 'machine' with the actual map returned by the 'machine' function
          DateTime createdAtDateTime = DateTime.parse(createdAtString);
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HistorySinglePage(
                        machineId:
                            (machine as Map<String, dynamic>)['machineId'],
                        id: machine['_id'],
                      )));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ListTile(
                    tileColor: Colors.white, // Set the color to blue
                    title:
                        Text('${(index + 1).toString()}. Data ke-${index + 1}'),
                    subtitle: Text(dateTimeToZone(
                      zone: "WIB",
                      datetime: createdAtDateTime,
                    ).toString())),
              ),
            ),
          );
        },
      ),
    );
  }
}
