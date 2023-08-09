import 'package:flutter/material.dart';
import 'package:my_app/screens/singles/historyList.dart';
// import 'package:my_app/screens/singles/historySingle.dart';
import 'package:my_app/services/machineData_service.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  MachineDataService machineDataService = MachineDataService();

  var listMachines = [
    {
      'title': 'Data Record A',
      'machineId': 1,
      'color': const Color.fromARGB(255, 0, 0, 0)
    },
    {
      'title': 'Data Record B',
      'machineId': 2,
      'color': const Color.fromARGB(255, 43, 43, 42)
    },
    {
      'title': 'Data Record C',
      'machineId': 3,
      'color': const Color.fromARGB(255, 68, 68, 68)
    },
    {
      'title': 'Data Record D',
      'machineId': 4,
      'color': const Color.fromARGB(255, 70, 70, 70)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.youtube_searched_for,
                          size: 26,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Data Record',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: listMachines
                      .map(
                        (machine) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HistoryListPage(
                                  machineId: (machine
                                      as Map<String, dynamic>)['machineId'],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: (machine as Map<String, dynamic>)['color'],
                            ),
                            child: Center(
                              child: Text(
                                (machine as Map<String, dynamic>)['title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

















// class HistoryPage extends StatefulWidget {
//   const HistoryPage({Key? key}) : super(key: key);

//   @override
//   State<HistoryPage> createState() => _HistoryPageState();
// }

// class _HistoryPageState extends State<HistoryPage> {
//   MachineDataService machineDataService = MachineDataService();

//   var listMachines = [
//     {'title': 'History Machine A', 'machineId': 1, 'color': Colors.blue},
//     {'title': 'History Machine B', 'machineId': 2},
//     {'title': 'History Machine C', 'machineId': 3},
//     {'title': 'History Machine D', 'machineId': 4},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 211, 211, 211),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.only(top: 30),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 20),
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.youtube_searched_for,
//                           size: 26,
//                           color: Colors.black,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           'Data History',
//                           style: TextStyle(
//                               fontSize: 26, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: listMachines
//                         .map((machine) => GestureDetector(
//                               onTap: () {
//                                 Navigator.of(context).push(
//                                     // MaterialPageRoute(builder: (context) => HistorySinglePage(machineId: (machine as Map<String, dynamic>)['machineId']))
//                                     MaterialPageRoute(
//                                         builder: (context) => HistoryListPage(
//                                             machineId: (machine as Map<String,
//                                                 dynamic>)['machineId'])));
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.only(bottom: 30),
//                                 width: double.infinity,
//                                 height: 100,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: Color.fromARGB(255, 0, 0, 0)),
//                                 child: Center(
//                                   child: Text(
//                                     (machine as Map<String, dynamic>)['title'],
//                                     style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             ))
//                         .toList(),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
