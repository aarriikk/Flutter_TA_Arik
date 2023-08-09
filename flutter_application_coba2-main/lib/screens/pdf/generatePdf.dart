import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

Future<Uint8List> generatePdf(Map<String, dynamic> data,
    Map<String, dynamic> param, Map<String, dynamic> raspi) async {
  final pdf = pw.Document();

  final robotoLight = await PdfGoogleFonts.robotoLight();
  print(param);
  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.Center(
            child: pw.RichText(
              text: pw.TextSpan(
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 25,
                  ),
                  children: [
                    pw.TextSpan(
                        text: 'Data Machine ${data['machineId']}',
                        // ... ${param['upTime']}.... ${raspi['downTime']}

                        style: pw.TextStyle(font: robotoLight, fontSize: 40)),
                  ]),
            ),
          ),
          pw.Divider(
            thickness: 6, // Adjust the thickness value as needed
            color: PdfColors.black, // Set the color of the divider
          ),
          pw.SizedBox(height: 10),
          pw.Divider(
            thickness: 3,
            color: PdfColors.black,
          ),

          pw.Center(
            child: pw.Text(
              'Overall Equipment Effectiveness',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
          ),

          pw.SizedBox(height: 4),

          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // RichText
              pw.RichText(
                text: pw.TextSpan(
                  style: pw.TextStyle(fontSize: 22),
                  children: [
                    pw.TextSpan(
                      text: 'Mesin ini memiliki nilai OEE, yaitu ',
                    ),
                    pw.TextSpan(
                      text: '${data['OEE'] * 100}%',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Equation
              pw.Text(
                'Equation: (((${param['upTime']} * 60) - ${raspi['downTime']}) / ${param['upTime']}) * (${param['cycleTime']} / ((${param['upTime']} * 60) - ${raspi['downTime']}) / ${raspi['realQuantity']})) * 1',
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black),
              ),
            ],
          ),

          pw.Divider(
            thickness: 3,
            color: PdfColors.black,
          ),

          pw.SizedBox(height: 2),
          pw.Center(
            child: pw.Text(
              'Operation KPIs',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.SizedBox(height: 10),
          // pw.Text(
          //     'Mesin yang sedang diamati memiliki ID: ${data['machineId']}',
          //     style: const pw.TextStyle(fontSize: 22)),
          // pw.SizedBox(height: 20),
          // running time
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // RichText
              pw.RichText(
                text: pw.TextSpan(
                  style: pw.TextStyle(fontSize: 22),
                  children: [
                    pw.TextSpan(
                      text:
                          'Mesin ini memiliki waktu running yang sebenarnya selama ',
                    ),
                    pw.TextSpan(
                      text: '${data['realTime']} detik',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.TextSpan(
                      text: ' atau selama ',
                    ),
                    pw.TextSpan(
                      text: '${data['realTime'].toInt() ~/ 60} menit',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Equation
              pw.Text(
                'Equation: (${param['upTime']} *60) - ${raspi['downTime']}',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
            ],
          ),

          pw.SizedBox(height: 2),
          pw.Divider(
            thickness: 1,
            color: PdfColors.black,
          ),
          pw.SizedBox(height: 2),
          ////////////////////////////////// presentase waktu optimal dengan aktual
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // RichText
              pw.RichText(
                text: pw.TextSpan(
                  style: pw.TextStyle(fontSize: 22),
                  children: [
                    pw.TextSpan(
                      text:
                          'Presentase waktu antara optimal dengan aktual adalah ',
                    ),
                    pw.TextSpan(
                      text: '${data['percentageTime'].toInt()}%',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Equation
              pw.Text(
                'Equation:  (((${param['upTime']} * 60) - ${raspi['downTime']}) / (${param['upTime']} * 60)) * 100',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
            ],
          ),

          pw.SizedBox(height: 2),
          pw.Divider(
            thickness: 1,
            color: PdfColors.black,
          ),
          pw.SizedBox(height: 2),
          /////////////////////////////// cycle time
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.RichText(
                text: pw.TextSpan(
                  style: pw.TextStyle(fontSize: 22),
                  children: [
                    pw.TextSpan(
                      text: 'Real cycle time mesin ',
                    ),
                    pw.TextSpan(
                      text: '${data['machineId']}',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.TextSpan(
                      text: ' adalah ',
                    ),
                    pw.TextSpan(
                      text: '${data['cycleTime'].toInt()} detik/PCS',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Equation
              pw.Text(
                'Equation: (${param['upTime']} * 60) - ${raspi['downTime']}) / ${raspi['realQuantity']}',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
              ),
            ],
          ),

          pw.SizedBox(height: 2),
          pw.Divider(
            thickness: 1,
            color: PdfColors.black,
          ),
          pw.SizedBox(height: 2),
          //////////////////////////////// optimal produksi
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // RichText
              pw.RichText(
                text: pw.TextSpan(
                  style: pw.TextStyle(fontSize: 22),
                  children: [
                    pw.TextSpan(
                      text: 'Mesin ',
                    ),
                    pw.TextSpan(
                      text: '${data['machineId']}',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.TextSpan(
                      text: ' dengan kondisi optimal dapat menghasilkan ',
                    ),
                    pw.TextSpan(
                      text: '${data['optimalQty'].toInt()} Pcs',
                      style: pw.TextStyle(
                        fontSize: 22,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Equation
              pw.Text(
                'Equation: (${param['upTime']} * 60) / ((${param['upTime']} * 60) - ${raspi['downTime']}) / ${raspi['realQuantity']})',
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black),
              ),
            ],
          ),

          pw.SizedBox(height: 2),
          pw.Divider(
            thickness: 3,
            color: PdfColors.black,
          ),
          pw.SizedBox(height: 2),

          //////////////////////////////// perbandingan produksi

          pw.Center(
            child: pw.Text(
              'Planning KPIs',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
          ),

          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // RichText
              pw.RichText(
                text: pw.TextSpan(
                  style: pw.TextStyle(fontSize: 22),
                  children: [
                    pw.TextSpan(
                      text:
                          'Perbandingan produksi optimal dengan produksi aktual pada mesin ',
                    ),
                    pw.TextSpan(
                      text: '${data['machineId']}',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.TextSpan(
                      text: ' adalah ',
                    ),
                    pw.TextSpan(
                      text: '${data['productionRate'].toInt()}%',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Equation
              pw.Text(
                'Equation: (${raspi['realQuantity']} / ((${param['upTime']} * 60) / ((${param['upTime']} * 60) - ${raspi['downTime']}) / ${raspi['realQuantity']}))) * 100 ',
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black),
              ),
            ],
          ),

          pw.SizedBox(height: 2),
          pw.Divider(
            thickness: 1,
            color: PdfColors.black,
          ),
          pw.SizedBox(height: 2),

          /////////////////////////////////////// OEE

          // pw.Column(
          //   crossAxisAlignment: pw.CrossAxisAlignment.start,
          //   children: [
          //     // RichText
          //     pw.RichText(
          //       text: pw.TextSpan(
          //         style: pw.TextStyle(fontSize: 22),
          //         children: [
          //           pw.TextSpan(
          //             text: 'Mesin ini memiliki nilai OEE, yaitu ',
          //           ),
          //           pw.TextSpan(
          //             text: '${data['OEE'] * 100}%',
          //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //     ),
          //     // Equation
          //     pw.Text(
          //       'Equation: (((${param['upTime']} * 60) - ${raspi['downTime']}) / (${param['upTime']} * 60)) * (${param['cycleTime']} / ((${param['upTime']} * 60) - ${raspi['downTime']}) / ${raspi['realQuantity']})) * 1',
          //       style: pw.TextStyle(
          //           fontSize: 18,
          //           fontWeight: pw.FontWeight.bold,
          //           color: PdfColors.black),
          //     ),
          //   ],
          // ),

          /////////////////////////////////// perbandingan kuantitas
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // RichText
              pw.RichText(
                text: pw.TextSpan(
                  style: pw.TextStyle(fontSize: 22),
                  children: [
                    pw.TextSpan(
                      text:
                          'Perbandingan antara kuantitas asli dengan target adalah ',
                    ),
                    pw.TextSpan(
                      text: '${data['percentageQty'].toInt()}%',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Equation
              pw.Text(
                'Equation: (${raspi['realQuantity']} / ${param['quantityTarget']}) * 100',
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black),
              ),
            ],
          ),

          pw.SizedBox(height: 2),
          pw.Divider(
            thickness: 3,
            color: PdfColors.black,
          ),
          pw.SizedBox(height: 2),
          ///////////////////////////////////////// konsumsi energi

          pw.Center(
            child: pw.Text(
              'Energy KPIs',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
          ),

          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // RichText
              pw.RichText(
                text: pw.TextSpan(
                  style: pw.TextStyle(fontSize: 22),
                  children: [
                    pw.TextSpan(
                      text: 'Konsumsi energi pada mesin ',
                    ),
                    pw.TextSpan(
                      text: '${data['machineId']}',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.TextSpan(
                      text: ' memakan ',
                    ),
                    pw.TextSpan(
                      text:
                          'Rp${NumberFormat.decimalPattern().format(data['energyConsumption'].toInt())}.00',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Equation
              pw.Text(
                'Equation: (${raspi['kiloWattPerHour']} * 1114)',
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black),
              ),
            ],
          ),

          pw.SizedBox(height: 2),
          pw.Divider(
            thickness: 3,
            color: PdfColors.black,
          ),
          pw.SizedBox(height: 2),

          ////////////////////////////////////////// raw matterial cost

          pw.Center(
            child: pw.Text(
              'Raw-Material KPIs',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
          ),

          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // RichText
              pw.RichText(
                text: pw.TextSpan(
                  style: pw.TextStyle(fontSize: 22),
                  children: [
                    pw.TextSpan(
                      text: 'Pengeluaran pada raw material sebanyak ',
                    ),
                    pw.TextSpan(
                      text:
                          'Rp${NumberFormat.decimalPattern().format(data['rawMaterialCost'].toInt())}.00',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Equation
              pw.Text(
                'Equation: ((${raspi['realQuantity']} * ${param['rawMaterialGram']}) / 1000) * ${param['rawMaterialPrice']}',
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black),
              ),
            ],
          ),

          pw.SizedBox(height: 2),
          pw.Divider(
            thickness: 3,
            color: PdfColors.black,
          ),
          pw.SizedBox(height: 2),

////////////////////////// down time cost

          pw.Center(
            child: pw.Text(
              'Maintenance KPIs',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
          ),

          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // RichText
              pw.RichText(
                text: pw.TextSpan(
                  style: pw.TextStyle(fontSize: 22),
                  children: [
                    pw.TextSpan(
                      text: 'Kerugian yang disebabkan oleh downtime sebanyak ',
                    ),
                    pw.TextSpan(
                      text:
                          'Rp${NumberFormat.decimalPattern().format(data['downTimeCost'].toInt())}.00',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Equation
              pw.Text(
                'Equation: (${raspi['downTime']} / (${param['upTime']} * 60) - ${raspi['downTime']}) / ${raspi['realQuantity']}) * Biaya manufaktur aktual',
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black),
              ),
            ],
          ),

          pw.SizedBox(height: 2),
          pw.Divider(
            thickness: 3,
            color: PdfColors.black,
          ),
          pw.SizedBox(height: 2),

          /////////////////////////////// BEP aktual

          pw.Center(
            child: pw.Text(
              'Manufacturing Cost',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
          ),

          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // RichText
              pw.RichText(
                text: pw.TextSpan(
                  style: pw.TextStyle(fontSize: 22),
                  children: [
                    pw.TextSpan(
                      text: 'Biaya manufaktur yang dihasilkan oleh mesin ',
                    ),
                    pw.TextSpan(
                      text: '${data['machineId']}',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.TextSpan(
                      text: ' adalah ',
                    ),
                    pw.TextSpan(
                      text:
                          'Rp${NumberFormat.decimalPattern().format(data['actualBEP'].toInt())}.00/PCS',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Equation
              pw.Text(
                'Equation: (((${raspi['kiloWattPerHour']} * 1114) + (${raspi['realQuantity']} * ${param['rawMaterialGram']})) / 1000) * ${param['rawMaterialPrice']}) / ${raspi['realQuantity']}',
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black),
              ),
            ],
          ),

          pw.SizedBox(height: 2),
          pw.Divider(
            thickness: 1,
            color: PdfColors.black,
          ),
          pw.SizedBox(height: 2),

          ///////////////////////////////////////////////// BEP optimal

          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // RichText
              pw.RichText(
                text: pw.TextSpan(
                  style: pw.TextStyle(fontSize: 22),
                  children: [
                    pw.TextSpan(
                      text:
                          'Biaya manufaktur optimal yang dapat dihasilkan oleh mesin ',
                    ),
                    pw.TextSpan(
                      text: '${data['machineId']}',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.TextSpan(
                      text: ' adalah ',
                    ),
                    pw.TextSpan(
                      text:
                          'Rp${NumberFormat.decimalPattern().format(data['optimalBEP'].toInt())}.00/PCS',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // Equation
              pw.Text(
                'Equation: (((${raspi['kiloWattPerHour']} * 1114)  + ((((${param['upTime']} * 60) / ${param['cycleTime']}) * ${param['rawMaterialGram']}) / 1000) * ${param['rawMaterialPrice']}) / ((${param['upTime']} * 60) / ${param['cycleTime']})',
                style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black),
              ),
            ],
          ),

          pw.SizedBox(height: 2),
          pw.Divider(
            thickness: 3,
            color: PdfColors.black,
          ),
          pw.SizedBox(height: 2),

          pw.SizedBox(height: 2),

          if ((data['OEE'] * 100) >= 100) ...[
            pw.Center(
              child: pw.Container(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  "OEE Sempurna",
                  style:
                      const pw.TextStyle(fontSize: 50, color: PdfColors.green),
                ),
              ),
            ),
          ] else if ((data['OEE'] * 100) >= 85) ...[
            pw.Center(
              child: pw.Container(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  "OEE memenuhi standar",
                  style:
                      const pw.TextStyle(fontSize: 50, color: PdfColors.yellow),
                ),
              ),
            ),
          ] else if ((data['OEE'] * 100) >= 60) ...[
            pw.Center(
              child: pw.Container(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  "OEE dapat dikembangkan",
                  style:
                      const pw.TextStyle(fontSize: 50, color: PdfColors.orange),
                ),
              ),
            ),
          ] else if ((data['OEE'] * 100) >= 0) ...[
            pw.Center(
              child: pw.Container(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  "OEE sangat rendah",
                  style: const pw.TextStyle(fontSize: 50, color: PdfColors.red),
                ),
              ),
            ),
          ],
          pw.SizedBox(height: 2),
          pw.Divider(
            thickness: 3,
            color: PdfColors.black,
          ),
          pw.SizedBox(height: 2),
        ];
      },
      // pageTheme: pw.PageTheme(
      //     pageFormat: PdfPageFormat.a4,
      //     theme: pw.ThemeData.withFont(base: robotoLight),
      //     buildBackground: (context) => pw.FullPage(
      //           ignoreMargins: true,
      //         )),
    ),
  );

  return pdf.save();
}








//   pdf.addPage(pw.Page(
//     build: (context) => pw.Column(children: [
//       pw.SizedBox(height: 20),
//       pw.Column(
//           mainAxisAlignment: pw.MainAxisAlignment.center,
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Center(
//               child: pw.RichText(
//                 text: pw.TextSpan(
//                     style: pw.TextStyle(
//                       fontWeight: pw.FontWeight.bold,
//                       fontSize: 25,
//                     ),
//                     children: [
//                       pw.TextSpan(
//                           text: 'Data Machine ${data['machineId']}',
//                           style: pw.TextStyle(font: robotoLight, fontSize: 40)),
//                     ]),
//               ),
//             ),
//             pw.Divider(
//               thickness: 4, // Adjust the thickness value as needed
//               color: PdfColors.black, // Set the color of the divider
//             ),
//             pw.SizedBox(height: 10),
//             // pw.Text(
//             //     'Mesin yang sedang diamati memiliki ID: ${data['machineId']}',
//             //     style: const pw.TextStyle(fontSize: 22)),
//             // pw.SizedBox(height: 20),
//             pw.Text(
//                 'Mesin ini memiliki waktu running yang sebenarnya selama ${data['realTime']} menit atau selama ${data['realTime'].toInt() ~/ 60} jam',
//                 style: const pw.TextStyle(fontSize: 22)),
//             pw.SizedBox(height: 2),
//             pw.Divider(),
//             pw.SizedBox(height: 2),
//             pw.Text(
//                 'Presentase waktu antara optimal dengan aktual adalah ${data['percentageTime'].toInt()}%',
//                 style: const pw.TextStyle(fontSize: 22)),
//             pw.SizedBox(height: 5),
//             pw.Text(
//                 'Real cycle time mesin ${data['machineId']} adalah ${data['cycleTime'].toInt()} detik',
//                 style: const pw.TextStyle(fontSize: 22)),
//             pw.SizedBox(height: 5),

//             pw.Text(
//                 'Mesin ${data['machineId']} dengan kondisi optimal dapat menghasilkan ${data['optimalQty'].toInt()} Pcs',
//                 style: const pw.TextStyle(fontSize: 22)),
//             pw.SizedBox(height: 5),
//             pw.Text(
//                 'Perbandingan produksi optimal dengan produksi aktual pada mesin  ${data['machineId']} adalah adalah ${data['productionRate'].toInt()}% ',
//                 style: const pw.TextStyle(fontSize: 22)),
//             pw.SizedBox(height: 5),

//             // pw.Text('Mesin ini memiliki nilai OEE, yaitu ${data['OEE']}%',
//             //     style: const pw.TextStyle(fontSize: 22)),
//             pw.SizedBox(height: 5),
//             pw.Text(
//                 'Perbandingan antara kuantitas asli dengan target adalah ${(data['percentageQty'].toInt())}%',
//                 style: const pw.TextStyle(fontSize: 22)),
//             pw.SizedBox(height: 5),
//             pw.Text(
//                 'Konsumsi energi pada mesin ${data['machineId']} memakan Rp${NumberFormat.decimalPattern().format(data['energyConsumption'].toInt())}.00',
//                 style: const pw.TextStyle(fontSize: 22)),
//             pw.SizedBox(height: 5),

//             pw.Text(
//                 'Pengeluaran pada raw matterial sebanyak Rp${NumberFormat.decimalPattern().format(data['rawMaterialCost'].toInt())}.00',
//                 style: const pw.TextStyle(fontSize: 22)),
//             pw.SizedBox(height: 5),
//             pw.Text(
//                 'Kerugian yang disebabkan oleh down time sebanyak Rp${NumberFormat.decimalPattern().format(data['downTimeCost'].toInt())}.00',
//                 style: const pw.TextStyle(fontSize: 22)),
//             pw.SizedBox(height: 5),
//             pw.Text(
//                 'BEP yang dihasilkan oleh mesin ${data['machineId']} adalah Rp${NumberFormat.decimalPattern().format(data['actualBEP'].toInt())}.00',
//                 style: const pw.TextStyle(fontSize: 22)),
//             pw.SizedBox(height: 5),
//             pw.Text(
//                 'BEP optimal yang dapat dihasilkan oleh mesin ${data['machineId']} adalah Rp${NumberFormat.decimalPattern().format(data['optimalBEP'].toInt())}.00',
//                 style: const pw.TextStyle(fontSize: 22)),
//             pw.SizedBox(height: 5),
//           ])
//     ]),
//     pageTheme: pw.PageTheme(
//         pageFormat: PdfPageFormat.a4,
//         theme: pw.ThemeData.withFont(base: robotoLight),
//         buildBackground: (context) => pw.FullPage(
//               ignoreMargins: true,
//             )),
//   ));

//   return pdf.save();
// }
