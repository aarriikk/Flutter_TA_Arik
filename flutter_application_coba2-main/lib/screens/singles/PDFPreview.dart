// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:my_app/screens/pdf/generatePdf.dart';
// import 'package:my_app/services/machineData_service.dart';
// import 'package:my_app/utils/utils.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:printing/printing.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:open_file/open_file.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// class PDFPreviewScreen extends StatefulWidget {
//   final String pdfPath;

//   PDFPreviewScreen({required this.pdfPath});

//   @override
//   _PDFPreviewScreenState createState() => _PDFPreviewScreenState();
// }

// class _PDFPreviewScreenState extends State<PDFPreviewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Preview'),
//       ),
//       body: PDFView(
//         filePath: widget.pdfPath,
//       ),
//     );
//   }
// }
