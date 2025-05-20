import 'package:flutter/material.dart';

class CourseUnitRegistrationData {
  final String refNo;
  final String program;
  final String stage;
  final int units;
  final int charges;

  CourseUnitRegistrationData({
    required this.refNo,
    required this.program,
    required this.stage,
    required this.units,
    required this.charges,
  });
}

class CourseUnitRegistrationScreen extends StatelessWidget {
  final List<CourseUnitRegistrationData> registrations = [
    CourseUnitRegistrationData(refNo: 'SRA243026', program: 'BSCS', stage: 'Y2S1', units: 7, charges: 939),
    CourseUnitRegistrationData(refNo: 'SRQ243027', program: 'BSCS', stage: 'Y2S1', units: 7, charges: 939),
    CourseUnitRegistrationData(refNo: 'SRA243029', program: 'BSCS', stage: 'Y2S1', units: 7, charges: 939),
    CourseUnitRegistrationData(refNo: 'SRJ250992', program: 'BSCS', stage: 'Y2S1', units: 7, charges: 915),
  ];

  CourseUnitRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Course Unit Registration')),
      body: ListView.builder(
        itemCount: registrations.length,
        itemBuilder: (context, index) {
          final reg = registrations[index];
          return ListTile(
            title: Text('${reg.refNo} - ${reg.program}'),
            subtitle: Text('Stage: ${reg.stage}, Units: ${reg.units}, Charges: ${reg.charges}'),
          );
        },
      ),
    );
  }
}
