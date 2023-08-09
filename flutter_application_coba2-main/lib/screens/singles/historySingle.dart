import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/screens/pdf/generatePdf.dart';
import 'package:my_app/services/machineData_service.dart';
import 'package:my_app/utils/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class HistorySinglePage extends StatefulWidget {
  final int machineId;
  final String id;
  const HistorySinglePage(
      {super.key, required this.machineId, required this.id});

  @override
  State<HistorySinglePage> createState() => _HistorySinglePageState();
}

class _HistorySinglePageState extends State<HistorySinglePage> {
  final machineDataService = MachineDataService();
  Map<String, dynamic> _machines = {};
  Map<String, dynamic> _param = {};
  Map<String, dynamic> _raspi = {};
  final pdf = pw.Document();

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    final bytes = await build(pageFormat);

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File('$appDocPath/document.pdf');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  @override
  void initState() {
    super.initState();
    _fetchDatas();
    // _fetchParams();
    // _fetchRaspi();
  }

  Future<void> _fetchDatas() async {
    try {
      final resMachine = await machineDataService.getDataPdf(
          context: context, machineId: widget.machineId, id: widget.id);
      final resParameter = await machineDataService.getAllMparam(
          context: context, machineId: widget.machineId);
      final resRaspi = await machineDataService.getByIdRaspi(
          context: context, id: widget.id);

      final Map<String, dynamic> resMachineData = json.decode(resMachine!.body);
      final Map<String, dynamic> resParamData = json.decode(resParameter!.body);
      final Map<String, dynamic> resRaspiData = json.decode(resRaspi!.body);

      if (resMachineData['status'] == 'success' &&
          resParamData['status'] == 'success' &&
          resRaspiData['status'] == 'success') {
        final Map<String, dynamic> data = resMachineData['data'];
        final Map<String, dynamic> dataParam = resParamData['data'][0];
        final Map<String, dynamic> dataRaspi = resRaspiData['data'];
        setState(() {
          _machines = data;
          _raspi = dataRaspi;
          _param = dataParam;
        });
      } else {
        showSnackBar(context, resMachineData['message'].toString());
      }
    } catch (err) {
      showSnackBar(context, err.toString());
    }
    print(_machines);
  }

  // Future<void> _fetchParams() async {
  //   try {
  //     final res = await machineDataService.getAllMparam(
  //         context: context, machineId: widget.machineId
  //         // , id: widget.id
  //         );
  //     print(res);
  //     final Map<String, dynamic> resData = json.decode(res!.body);

  //     if (resData['status'] == 'success') {
  //       final Map<String, dynamic> data = resData['data'];
  //       setState(() {
  //         _param = data;
  //       });
  //     } else {
  //       showSnackBar(context, resData['message'].toString());
  //     }
  //   } catch (err) {
  //     showSnackBar(context, err.toString());
  //   }
  //   //print(_param);
  // }

  // Future<void> _fetchRaspi() async {
  //   try {
  //     final res = await machineDataService.getByIdRaspi(
  //       context: context, machineId: widget.machineId,
  //       //id: widget.id
  //     );
  //     final Map<String, dynamic> resData = json.decode(res!.body);

  //     if (resData['status'] == 'success') {
  //       final Map<String, dynamic> data = resData['data'];
  //       setState(() {
  //         _raspi = data;
  //       });
  //     } else {
  //       showSnackBar(context, resData['message'].toString());
  //     }
  //   } catch (err) {
  //     showSnackBar(context, err.toString());
  //   }
  //   print(_raspi);
  // }

  // Future<void> _fetchRaspi() async {
  //   try {
  //     final res = await machineDataService.getByIdRaspi(
  //         context: context, machineId: widget.machineId
  //         //, id: widget.id
  //         );
  //     final Map<String, dynamic> resData = json.decode(res!.body);

  //     if (resData['status'] == 'success') {
  //       final Map<String, dynamic> data = resData['data'];
  //       setState(() {
  //         _raspi = data;
  //       });
  //     } else {
  //       showSnackBar(context, resData['message'].toString());
  //     }
  //   } catch (err) {
  //     showSnackBar(context, err.toString());
  //   }
  //   print(_raspi);
  // }

  Widget build(BuildContext context) {
    final actions = <PdfPreviewAction>[
      PdfPreviewAction(
        icon: const Icon(Icons.save),
        onPressed: _saveAsFile,
      )
    ];

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          title: const Text("DSS APP"),
          centerTitle: true,
          elevation: 20),
      backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      body: PdfPreview(
        build: (format) => generatePdf(_machines, _param, _raspi),
        maxPageWidth: 700,
        actions: actions,
      ),
    );
  }
}
