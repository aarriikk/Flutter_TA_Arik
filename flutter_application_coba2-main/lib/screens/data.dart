import 'package:flutter/material.dart';
import 'package:my_app/screens/singles/dataSingle.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  var listMachines = [
    {
      'title': 'Input Parameter A',
      'machineId': 1,
      'color': Color.fromARGB(255, 70, 70, 70)
    },
    {
      'title': 'Input Parameter B',
      'machineId': 2,
      'color': Color.fromARGB(255, 68, 68, 68)
    },
    {
      'title': 'Input Parameter C',
      'machineId': 3,
      'color': Color.fromARGB(255, 43, 43, 42)
    },
    {
      'title': 'Input Parameter D',
      'machineId': 4,
      'color': Color.fromARGB(255, 0, 0, 0)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 211, 211, 211),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.input,
                          size: 26,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Input Parameter',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
                                builder: (context) => DataSinglePage(
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









// class DataPage extends StatefulWidget {
//   const DataPage({Key? key}) : super(key: key);

//   @override
//   State<DataPage> createState() => _DataPageState();
// }

// class _DataPageState extends State<DataPage> {
//   var listMachines = [
//     {'title': 'Parameter Machine A', 'machineId': 1},
//     {'title': 'Parameter Machine B', 'machineId': 2},
//     {'title': 'Parameter Machine C', 'machineId': 3},
//     {'title': 'Parameter Machine D', 'machineId': 4},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 211, 211, 211),
//       body: Container(
//         child: SingleChildScrollView(
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
//                           Icons.input,
//                           size: 26,
//                           color: Colors.black,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           'Input Parameter',
//                           style: TextStyle(
//                               fontSize: 26, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: listMachines
//                         .map((machine) => GestureDetector(
//                               onTap: () {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) => DataSinglePage(
//                                         machineId: (machine as Map<String,
//                                             dynamic>)['machineId'])));
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
