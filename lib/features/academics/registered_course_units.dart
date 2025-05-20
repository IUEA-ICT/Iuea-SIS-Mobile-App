import 'package:flutter/material.dart';

class RegisteredCourseUnitData {
  final String refNo;
  final String program;
  final String stage;
  final int units;
  final int charges;

  RegisteredCourseUnitData({
    required this.refNo,
    required this.program,
    required this.stage,
    required this.units,
    required this.charges,
  });
}

class RegisteredCourseUnitsScreen extends StatelessWidget {
  final List<RegisteredCourseUnitData> registeredUnits = [
    RegisteredCourseUnitData(refNo: 'SRA243026', program: 'BSCS', stage: 'Y2S1', units: 7, charges: 939),
    RegisteredCourseUnitData(refNo: 'SRJ250992', program: 'BSCS', stage: 'Y2S1', units: 7, charges: 915),
  ];

  RegisteredCourseUnitsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registered Course Units')),
      body: ListView.builder(
        itemCount: registeredUnits.length,
        itemBuilder: (context, index) {
          final unit = registeredUnits[index];
          return ListTile(
            title: Text('${unit.refNo} - ${unit.program}'),
            subtitle: Text('Stage: ${unit.stage}, Units: ${unit.units}, Charges: ${unit.charges}'),
          );
        },
      ),
    );
  }
}
