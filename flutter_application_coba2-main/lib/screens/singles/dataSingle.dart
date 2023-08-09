import 'package:flutter/material.dart';
import 'package:my_app/services/machineData_service.dart';

class DataSinglePage extends StatefulWidget {
  final int machineId;
  const DataSinglePage({super.key, required this.machineId});

  @override
  State<DataSinglePage> createState() => _DataSinglePageState();
}

class _DataSinglePageState extends State<DataSinglePage> {
  final MachineDataService machineDataService = MachineDataService();
  late TextEditingController cycleController;
  late TextEditingController upTimeController;
  late TextEditingController objectTypeController;
  late TextEditingController quantityTargetController;
  late TextEditingController rawMaterialGramController;
  late TextEditingController rawMaterialPriceController;

  late List<Map<String, dynamic>> listInputs;

  void handleSubmit() async {
    machineDataService.createMachineData(
      context: context,
      machineId: widget.machineId,
      objectType: objectTypeController.text,
      upTime: upTimeController.text,
      cycleTime: cycleController.text,
      quantityTarget: quantityTargetController.text,
      rawMaterialGram: rawMaterialGramController.text,
      rawMaterialPrice: rawMaterialPriceController.text,
    );
  }

  @override
  void initState() {
    super.initState();

    cycleController = TextEditingController();
    upTimeController = TextEditingController();
    objectTypeController = TextEditingController();
    quantityTargetController = TextEditingController();
    rawMaterialGramController = TextEditingController();
    rawMaterialPriceController = TextEditingController();

    listInputs = [
      {
        'name': 'Object Type',
        'controller': objectTypeController,
        'type': 'text'
      },
      {
        'name': 'Quantity Target',
        'controller': quantityTargetController,
        'type': 'number'
      },
      {
        'name': 'Time Running',
        'controller': upTimeController,
        'type': 'number'
      },
      {
        'name': 'Cycle Time Machine',
        'controller': cycleController,
        'type': 'number'
      },
      {
        'name': 'Raw Material/pcs (g)',
        'controller': rawMaterialGramController,
        'type': 'number'
      },
      {
        'name': 'Raw Material Price (Kg)',
        'controller': rawMaterialPriceController,
        'type': 'number'
      },
    ];
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
              child: Text(
                'Input data as parameter for machine ${widget.machineId}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            if (listInputs != null)
              Column(
                  children: listInputs
                      .map(
                        (input) => Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                          child: TextField(
                            controller: input['controller'],
                            keyboardType: input['type'] == 'text'
                                ? TextInputType.text
                                : TextInputType.number,
                            decoration: InputDecoration(
                                labelText: input['name'],
                                border: const OutlineInputBorder()),
                          ),
                        ),
                      )
                      .toList()),
            Container(
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    handleSubmit();
                  },
                  child: const Text('Submit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
