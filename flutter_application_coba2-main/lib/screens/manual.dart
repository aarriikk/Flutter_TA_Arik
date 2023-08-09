// // import 'dart:ffi';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:pdf/widgets.dart' as pw;
// // import 'package:pdf/widgets.dart' as pdfWidgets;
// // import 'package:pdf/widgets.dart' as pdfPathProvider;
// // import 'package:pdf/widgets.dart' as pdfOpenFile;
// // import 'package:pdf/widgets.dart' as pdfPdf;
// // import 'package:my_app/screens/singles/historySingle.dart';
// import 'package:flutter/material.dart';
// // import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
// import 'package:pdf/pdf.dart';

// // import 'package:pdf/widgets.dart' as pw;

// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';

// import 'package:printing/printing.dart';

// class ManualPage extends StatefulWidget {
//   const ManualPage({super.key});

//   @override
//   State<ManualPage> createState() => _ManualPageState();
// }

// class _ManualPageState extends State<ManualPage> {
//   // _saveAsFile(context, build, pageFormat);

//   Future<void> _saveAsFile(
//     BuildContext context,
//     LayoutCallback build,
//     PdfPageFormat pageFormat,
//   ) async {
//     final bytes = await build(pageFormat);

//     final appDocDir = await getApplicationDocumentsDirectory();
//     final appDocPath = appDocDir.path;
//     final file = File('$appDocPath/document.pdf');
//     await file.writeAsBytes(bytes);
//     await OpenFile.open(file.path);
//   }

//   // Future<void> getPDF() async {
//   Future<Uint8List> getPDF() async {
//     final pdf = pw.Document();
//     final robotoLight = await PdfGoogleFonts.robotoLight();

//     final pageTheme = pw.PageTheme(
//       pageFormat: PdfPageFormat.a4,
//       theme: pw.ThemeData.withFont(base: robotoLight),
//       buildBackground: (context) => pw.FullPage(ignoreMargins: true),
//     );

//     pdf.addPage(pw.MultiPage(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) {
//         return [
//           pw.Container(
//               child: pw.Column(
//             children: [
//               pw.Text(
//                 "nilai sebenarnya dari energy consumption adalah Rp $k/Pcs sedangkan nilai optimalnya adalah Rp $l/Pcs",
//                 style: pw.TextStyle(fontSize: 30),
//               ),
//               pw.SizedBox(
//                 height: 20,
//               ),
//               pw.Text(
//                 "presentase uptime aktual dengan optimal adalah $q%",
//                 style: pw.TextStyle(fontSize: 30),
//               ),
//               pw.SizedBox(
//                 height: 20,
//               ),
//               pw.Text(
//                 "analisis dari maintenance/DT mesin adalah Rp $p",
//                 style: pw.TextStyle(fontSize: 30),
//               ),
//               pw.SizedBox(
//                 height: 20,
//               ),
//               pw.Text(
//                 "nilai sebenarnya dari penggunaan raw matterial adalah Rp $a dengan nilai optimalnya adalah Rp $r",
//                 style: pw.TextStyle(fontSize: 30),
//               ),
//               pw.SizedBox(
//                 height: 20,
//               ),
//               pw.Text(
//                 "BEP dari nilai diatas adalah Rp $d,00",
//                 style: pw.TextStyle(fontSize: 30),
//               ),
//               pw.SizedBox(
//                 height: 20,
//               ),
//               pw.Text(
//                 "BEP optimal dari nilai diatas adalah Rp $i,00",
//                 style: pw.TextStyle(fontSize: 30),
//               ),
//               pw.SizedBox(
//                 height: 20,
//               ),
//               pw.Text(
//                 "Presentase perbandingan antara BEP aktual dengan BEP optimal adalah $j%",
//                 style: pw.TextStyle(fontSize: 30),
//               ),
//               pw.SizedBox(
//                 height: 30,
//               ),
//               if (j > 80) ...[
//                 pw.Text(
//                   "BEP optimal",
//                   style: pw.TextStyle(fontSize: 50, color: PdfColors.green),
//                 ),
//               ] else ...[
//                 pw.Text(
//                   "BEP tidak optimal",
//                   style: pw.TextStyle(fontSize: 50, color: PdfColors.red),
//                 ),
//               ],
//               pw.Container()
//             ],
//           )),
//         ];
//       },
//       // pageTheme: pw.PageTheme(
//       //   pageFormat: PdfPageFormat.a4,
//       //   theme: pw.ThemeData.withFont(base: robotoLight),
//       //   buildBackground: (context) => pw.FullPage(ignoreMargins: true),
//       // ),
//     )); // Page

//     final bytes = await pdf.save();

//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/mydocument.pdf');
//     print('PDF File Path: ${file.path}');

//     await file.writeAsBytes(bytes);

//     if (await file.exists()) {
//       print('PDF file exists at the specified path.');
//       await OpenFile.open(file.path);
//       print('PDF opened successfully');
//     } else {
//       print('PDF file does not exist at the specified path.');
//     }

//     // if (await file.exists()) {
//     //   await OpenFile.open(file.path);
//     //   print('PDF opened successfully');
//     // } else {
//     //   print('PDF file does not exist');
//     // }

//     return bytes;
//   }

//   TextEditingController controller1 = TextEditingController();
//   TextEditingController controller2 = TextEditingController();
//   TextEditingController controller3 = TextEditingController();
//   TextEditingController controller4 = TextEditingController();
//   TextEditingController controller5 = TextEditingController();
//   TextEditingController controller6 = TextEditingController();
//   TextEditingController controller7 = TextEditingController();
//   TextEditingController controller8 = TextEditingController();
//   int? result = 0,
//       num1 = 0,
//       num2 = 0,
//       num3 = 0,
//       num4 = 0,
//       num5 = 0,
//       num6 = 0,
//       num7 = 0,
//       num8 = 0;
//   var a = 0,
//       b = 0,
//       c = 0,
//       d = 0,
//       e = 0,
//       f = 0,
//       g = 0,
//       h = 0,
//       i = 0,
//       j = 0,
//       k = 0,
//       l = 0,
//       m = 0,
//       n = 0,
//       o = 0,
//       p = 0,
//       q = 0,
//       r = 0,
//       s = 0,
//       t = 0,
//       u = 0;
//   // products = List.generate(
//   //   5,
//   //   (index) => {
//   //     "id": "${index + 1}",
//   //     "name": "produk ke - ${index + 1}",
//   //     "desc": DateTime.now().toString(),
//   //   },
//   // );

//   bool myBool = false;

//   @override
//   Widget build(BuildContext context) {
//     // final List<SubscriberSeries> data = [
//     //   SubscriberSeries(
//     //     year: "BEP Aktual",
//     //     subscriber: d,
//     //     barColor: charts.ColorUtil.fromDartColor(Colors.blue),
//     //   ),
//     //   SubscriberSeries(
//     //       year: "BEP Optimal",
//     //       subscriber: i,
//     //       barColor: charts.ColorUtil.fromDartColor(Colors.blue))
//     // ];

//     return Scaffold(
//         // drawer: Drawer(
//         //   child: Column(
//         //     children: [
//         //       Container(
//         //         padding: EdgeInsets.all(20),
//         //         width: double.infinity,
//         //         height: 150,
//         //         color: Colors.green,
//         //         alignment: Alignment.bottomLeft,
//         //         child: Text(
//         //           "Menu Pilihan",
//         //           style: TextStyle(
//         //             color: Colors.white,
//         //             fontSize: 24,
//         //           ),
//         //         ),
//         //       ),
//         //       SizedBox(
//         //         height: 10,
//         //       ),
//         //       ListTile(
//         //         leading: Icon(
//         //           Icons.home,
//         //           size: 35,
//         //         ),
//         //         title: Text(
//         //           "Home",
//         //           style: TextStyle(
//         //             fontSize: 24,
//         //           ),
//         //         ),
//         //       ),
//         //       ListTile(
//         //         onTap: () {
//         //           Navigator.of(context).pushReplacement(MaterialPageRoute(
//         //             builder: (context) => Profile(),
//         //           ));
//         //         },
//         //         leading: Icon(
//         //           Icons.account_circle,
//         //           size: 35,
//         //         ),
//         //         title: Text(
//         //           "Profile",
//         //           style: TextStyle(
//         //             fontSize: 24,
//         //           ),
//         //         ),
//         //       ),
//         //       ListTile(
//         //         onTap: () {
//         //           Navigator.of(context).pushReplacement(MaterialPageRoute(
//         //             builder: (context) => Settings(),
//         //           ));
//         //         },
//         //         leading: Icon(
//         //           Icons.settings,
//         //           size: 35,
//         //         ),
//         //         title: Text(
//         //           "Settings",
//         //           style: TextStyle(
//         //             fontSize: 24,
//         //           ),
//         //         ),
//         //       ),
//         //       ListTile(
//         //         onTap: () {
//         //           Navigator.of(context).pushReplacement(MaterialPageRoute(
//         //             builder: (context) => About(),
//         //           ));
//         //         },
//         //         leading: Icon(
//         //           Icons.help_outline,
//         //           size: 35,
//         //         ),
//         //         title: Text(
//         //           "About",
//         //           style: TextStyle(
//         //             fontSize: 24,
//         //           ),
//         //         ),
//         //       ),
//         //       ListTile(
//         //         onTap: () {
//         //           Navigator.of(context).pushReplacement(MaterialPageRoute(
//         //             builder: (context) => Help(),
//         //           ));
//         //         },
//         //         leading: Icon(
//         //           Icons.contacts,
//         //           size: 35,
//         //         ),
//         //         title: Text(
//         //           "Help",
//         //           style: TextStyle(
//         //             fontSize: 24,
//         //           ),
//         //         ),
//         //       ),
//         //       ListTile(
//         //         onTap: () {
//         //           Navigator.of(context).pushReplacement(MaterialPageRoute(
//         //             builder: (context) => LoginPage(),
//         //           ));
//         //         },
//         //         leading: Icon(
//         //           Icons.logout,
//         //           size: 35,
//         //         ),
//         //         title: Text(
//         //           "Log Out",
//         //           style: TextStyle(
//         //             fontSize: 24,
//         //           ),
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         // appBar: AppBar(
//         //     title: Center(
//         //   child: Text("Manual Page"),
//         // )),
//         body: SingleChildScrollView(
//       child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//         Text(
//           "Masukan Data",
//           style: TextStyle(fontSize: 40),
//         ),
//         SizedBox(
//           height: 30,
//         ),
//         TextField(
//           keyboardType: TextInputType.number,
//           controller: controller1,
//           decoration: InputDecoration(
//               labelText: "Raw Material keseluruhan",
//               suffixText: "Kg",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextField(
//           keyboardType: TextInputType.number,
//           controller: controller2,
//           decoration: InputDecoration(
//               labelText: "Harga Raw Material",
//               suffixText: "/Kg",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextField(
//           keyboardType: TextInputType.number,
//           controller: controller3,
//           decoration: InputDecoration(
//               labelText: "Penggunaan Raw Material per produk",
//               suffixText: "Gr/Pcs",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextField(
//           keyboardType: TextInputType.number,
//           controller: controller4,
//           decoration: InputDecoration(
//               labelText: "Penggunaan Listrik",
//               suffixText: "kWh",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextField(
//           keyboardType: TextInputType.number,
//           controller: controller5,
//           decoration: InputDecoration(
//               labelText: "Jumlah produksi",
//               suffixText: "Pcs",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextField(
//           keyboardType: TextInputType.number,
//           controller: controller6,
//           decoration: InputDecoration(
//               labelText: "Waktu yang dibutuhkan percycle",
//               suffixText: "Detik",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         TextField(
//           keyboardType: TextInputType.number,
//           controller: controller7,
//           decoration: InputDecoration(
//               labelText: "Waktu yang Dipantau",
//               suffixText: "Jam",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//         ),
//         TextButton(
//           onPressed: (() {
//             setState(() {
//               num1 = int.parse(controller1.text);
//               num2 = int.parse(controller2.text);
//               num3 = int.parse(controller3.text);
//               num4 = int.parse(controller4.text);
//               num5 = int.parse(controller5.text);
//               num6 = int.parse(controller6.text);
//               num7 = int.parse(controller7.text);
//               num8 = int.parse(controller7.text);
//               myBool = true;

//               a = num1! * num2!; // raw matt . harga raw matt / aktual raw matt
//               b = num4! * 1444; // harga penggunaan listrik
//               c = a + b;
//               d = c ~/ num5!; // BEP aktual
//               result = num1! * a;

//               e = (num7! * 3600) ~/ num6!; // jumlah pcs percycle dalam hrs
//               f = e * num3! ~/ 1000;
//               g = f * num2!;
//               h = g + b;
//               i = h ~/ e; // BEP optimal

//               j = i * 100 ~/ d; //presentasi BEP

//               k = num4! ~/ num5! * 1444; // energy consymption aktual

//               l = num4! ~/ e * 1444; // energy consumption optimal

//               m = num5! * num6! ~/ 3600; // up time aktual
//               o = (num7! - m) * 3600;
//               p = o ~/ num6! * d; // analisis maintenance

//               q = m * 100 ~/ num7!; // presentasi uptime aktual dengan optimal

//               r = num5! * num3! * num2! ~/ 1000; // raw matterial optimal
//             });

//             controller1.clear();
//             controller2.clear();
//             controller3.clear();
//             controller4.clear();
//             controller5.clear();
//             controller6.clear();
//             controller7.clear();
//             controller8.clear();
//           }),
//           child: Column(
//             children: [
//               Text(
//                 "INPUT DATA",
//                 style: TextStyle(fontSize: 20),
//               ),
//             ],
//           ),
//         ),
//         TextButton(
//             onPressed: () {
//               setState(() {
//                 myBool = false;
//               });
//             },
//             child: Text(
//               'Clear',
//               style: TextStyle(fontSize: 15),
//             )),
//         SizedBox(
//           height: 40,
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Visibility(
//               visible: myBool,
//               child: Column(
//                 children: [
//                   Text(
//                     "nilai sebenarnya dari energy consumption adalah Rp $k/Pcs sedangkan nilai optimalnya adalah Rp $l/Pcs",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "presentase uptime aktual dengan optimal adalah $q%",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "analisis dari maintenance/DT mesin adalah Rp $p",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "nilai sebenarnya dari penggunaan raw matterial adalah Rp $a dengan nilai optimalnya adalah Rp $r",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "BEP dari nilai diatas adalah Rp $d",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "BEP optimal dari nilai diatas adalah Rp $i",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Presentase perbandingan antara BEP aktual dengan BEP optimal adalah $j%",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   // SubsriberChart(data: data),
//                   if (j > 80) ...[
//                     Text(
//                       "BEP optimal",
//                       style: TextStyle(fontSize: 25, color: Colors.green),
//                     )
//                   ] else ...[
//                     Text(
//                       "BEP tidak optimal",
//                       style: TextStyle(fontSize: 25, color: Colors.red),
//                     ),
//                   ],
//                   SizedBox(
//                     height: 10,
//                   ),

//                   FloatingActionButton(
//                     onPressed: () async {
//                       Uint8List pdfBytes =
//                           await getPDF(); // Pass the data argument when invoking getPDF
//                     },
//                     child: Icon(Icons.download),
//                   ),

//                   //              PdfPreviewAction(
//                   //   icon: const Icon(Icons.save),
//                   //   onPressed: _saveAsFile,
//                   // )

//                   //Container(
//                   //child: chart,
//                   //)
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ]),
//     ));
//   }
// }
// //   Widget buildImage(Uint8List bytes) =>
// //       bytes != null ? Image.memory(bytes) : Container();
// // }


// //  void getPDF() async {
// //     final pdf = pw.Document();

// //   pdf.addPage(
// //     pw.MultiPage(
// //         pageFormat: PdfPageFormat.a4,
// //         build: (pw.Context context) {
// //           return [
// //             pw.Center(
// //               child: pw.RichText(
// //                 text: pw.TextSpan(
// //                     style: pw.TextStyle(
// //                       fontWeight: pw.FontWeight.bold,
// //                       fontSize: 25,
// //                     ),
// //                     children: [
// //                       pw.TextSpan(
// //                           text: 'Data Machine ${data['machineId']}',
// //                           style: pw.TextStyle(font: robotoLight, fontSize: 30)),
// //                     ]),
// //               ),
// //             ),
// //             pw.SizedBox(height: 40),
// //             // pw.Text(
// //             //     'Mesin yang sedang diamati memiliki ID: ${data['machineId']}',
// //             //     style: const pw.TextStyle(fontSize: 22)),
// //             // pw.SizedBox(height: 20),
// //             pw.Text(
// //                 'Mesin ini memiliki waktu running yang sebenarnya selama ${data['realTime']} menit',
// //                 style: const pw.TextStyle(fontSize: 22)),
// //             pw.SizedBox(height: 20),
// //             pw.Text(
// //                 'Mesin ini melakukan 1 cycle selama ${data['cycleTime']} detik',
// //                 style: const pw.TextStyle(fontSize: 22)),
// //             pw.SizedBox(height: 20),
// //             pw.Text(
// //                 'Mesin ini dengan kondisi optimal dapat menghasilkan ${data['optimalQty']} Pcs',
// //                 style: const pw.TextStyle(fontSize: 22)),
// //             pw.SizedBox(height: 20),
// //             pw.Text(
// //                 'Produksi yang dihasilkan oleh mesin ${data['machineId']} adalah ${data['productionRate']} Pcs',
// //                 style: const pw.TextStyle(fontSize: 22)),
// //             pw.SizedBox(height: 20),
// //             pw.Text('Mesin ini memiliki nilai OEE, yaitu ${data['OEE']}%',
// //                 style: const pw.TextStyle(fontSize: 22)),
// //             pw.SizedBox(height: 20),
// //             pw.Text(
// //                 'Perbandingan antara kuantitas optimal dengan aktual adalah ${data['percentageQty']}%',
// //                 style: const pw.TextStyle(fontSize: 22)),
// //             pw.SizedBox(height: 20),
// //             pw.Text(
// //                 'Konsumsi energi pada mesin ini memakan Rp${data['energyConsumption']}',
// //                 style: const pw.TextStyle(fontSize: 22)),
// //             pw.SizedBox(height: 20),
// //             pw.Text(
// //                 'Presentase waktu antara optimal dengan aktual adalah ${data['percentageTime']}%',
// //                 style: const pw.TextStyle(fontSize: 22)),
// //             pw.SizedBox(height: 20),
// //             pw.Text(
// //                 'Pengeluaran pada raw matterial sebanyak Rp${data['rawMaterialCost']}',
// //                 style: const pw.TextStyle(fontSize: 22)),
// //             pw.SizedBox(height: 20),
// //             pw.Text(
// //                 'BEP yang dihasilkan oleh mesin adalah Rp${data['actualBEP']}',
// //                 style: const pw.TextStyle(fontSize: 22)),
// //             pw.SizedBox(height: 20),
// //             pw.Text(
// //                 'BEP optimal yang dapat dihasilkan oleh mesin adalah Rp${data['optimalBEP']}',
// //                 style: const pw.TextStyle(fontSize: 22)),
// //             pw.SizedBox(height: 20),
// //             pw.Text(
// //                 'Kerugian yang disebabkan oleh down time sebanyak Rp${data['downTimeCost']}',
// //                 style: const pw.TextStyle(fontSize: 22)),
// //             pw.SizedBox(height: 20)
// //           ];
// //         }
// //         ),
// //   );

// //   return pdf.save();
  
// // }


// //  pageTheme: pw.PageTheme(
// //         pageFormat: PdfPageFormat.a4,
// //         theme: pw.ThemeData.withFont(base: robotoLight),
// //         buildBackground: (context) => pw.FullPage(
// //               ignoreMargins: true,
// //             )),