import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:my_app/models/realtime_model.dart';
import 'dart:async';

class MonitoringPage extends StatefulWidget {
  const MonitoringPage({super.key});
  @override
  State<MonitoringPage> createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  final fb = FirebaseDatabase.instance;
  late DatabaseReference _dataRef;

  Map<int, Timer?> machineTimers = {};
  Map<int, Duration> counterDurations = {};
  Map<int, Duration> machineCounters = {};

  List<Downtime> _dtList = [];
  List<Quantity> _qtyList = [];
  List<Energy> _energyList = [];
  List<Kwh> _kwhList = [];

  @override
  void initState() {
    super.initState();
    print('monitoring page start');
    _dataRef = fb.ref().child('data');

    _dataRef.child('dt').onValue.listen((event) {
      List<Downtime> newDowntimeList = [];
      if (event.snapshot.value != null) {
        var dataList = event.snapshot.value as List<dynamic>;
        for (var item in dataList) {
          DateTime? downTimeStartTime = item['downTimeStartTime'] != null
              ? DateTime.parse(item['downTimeStartTime'])
              : null;

          int machineId = item['machine_id'];

          if (!machineTimers.containsKey(machineId)) {
            machineCounters[machineId] =
                counterDurations[machineId] ?? Duration();

            if (item['status'] == 0) {
              machineTimers[machineId] = Timer.periodic(
                  Duration(seconds: 1), (_) => _updateCounter(machineId));
            }

            if (downTimeStartTime != null) {
              machineCounters[machineId] =
                  DateTime.now().difference(downTimeStartTime);
            }
          } else {
            if (item['status'] == 1) {
              machineTimers[machineId]?.cancel();
              machineTimers.remove(machineId);
            }
          }

          newDowntimeList.add(Downtime(
              machineId: item['machine_id'],
              downTimeStartTime: downTimeStartTime,
              status: item['status']));
        }
      }

      setState(() {
        _dtList = newDowntimeList;
      });
    });

    _dataRef.child('qty').onValue.listen((event) {
      List<Quantity> newQtyList = [];
      if (event.snapshot.value != null) {
        var dataList = event.snapshot.value as List<dynamic>;
        for (var item in dataList) {
          newQtyList.add(
              Quantity(machineId: item['machine_id'], value: item['value']));
        }
      }

      setState(() {
        _qtyList = newQtyList;
      });
    });

    _dataRef.child('energy').onValue.listen((event) {
      List<Energy> newEnergyList = [];
      if (event.snapshot.value != null) {
        var dataList = event.snapshot.value as List<dynamic>;
        for (var i = 0; i < dataList.length; i++) {
          var energyItem = dataList[i];
          var energyValue = (energyItem['value'] as num).toDouble();
          var createdAt = energyItem['createdAt'];

          double kwhValue = 0.0;
          if (_kwhList.length > i) {
            kwhValue = _kwhList[i].value;
          }

          double updateValue = energyValue - kwhValue;

          newEnergyList.add(Energy(value: updateValue, createdAt: createdAt));
        }
      }

      setState(() {
        _energyList = newEnergyList;
      });
    });

    _dataRef.child('kwh').onValue.listen((event) {
      List<Kwh> newKwhList = [];
      if (event.snapshot.value != null) {
        var dataList = event.snapshot.value as List<dynamic>;
        for (var item in dataList) {
          newKwhList.add(Kwh(
              value: (item['value'] as num).toDouble(),
              createdAt: item['createdAt']));
        }
      }

      setState(() {
        _kwhList = newKwhList;
      });
    });
  }

  void _updateCounter(int machineId) {
    if (machineCounters.containsKey(machineId)) {
      setState(() {
        machineCounters[machineId] =
            machineCounters[machineId]! + Duration(seconds: 1);
      });
    }
  }

  @override
  void dispose() {
    _dataRef.onValue.listen(null);
    machineTimers.values.forEach((timer) {
      timer?.cancel();
    });
    machineTimers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Downtime Data'),
          buildDataList(_dtList),
          SizedBox(
            height: 20,
          ),
          Text('Quantity Data'),
          buildDataList(_qtyList),
          SizedBox(
            height: 20,
          ),
          Text('Energy Data'),
          buildDataList(_energyList)
        ],
      ),
    ));
  }

  ListView buildDataList(List<dynamic> dataList) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final data = dataList[index];

        if (data is Energy) {
          return ListTile(
            title: Text('Value: ${data.value}'),
            subtitle: Text('CreatedAt: ${data.createdAt}'),
          );
        } else if (data is Downtime) {
          int machineId = data.machineId;
          String subtitle = '';

          if (data.status == 1) {
            subtitle = 'Machine in Production';
          } else if (data.status == 0) {
            subtitle = 'Machine in Down Time';
            //\nCounter: ${formatDuration(machineCounters[data.machineId]!)}
          }

          return ListTile(
            title: Text('Machine ID: ${data.machineId}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Status: ${data.status}'),
                Text(subtitle),
              ],
            ),
          );
        } else if (data is Quantity) {
          return ListTile(
            title: Text('Machine ID: ${data.machineId}'),
            subtitle: Text('Status: ${data.value}'),
          );
        }
      },
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
