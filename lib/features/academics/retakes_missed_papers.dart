import 'package:flutter/material.dart';

class RetakeSubmissionData {
  final String refNo;
  final String program;
  final String stage;

  RetakeSubmissionData({
    required this.refNo,
    required this.program,
    required this.stage,
  });
}

class RegisteredRetakeData {
  final String refNo;
  final String program;
  final String stage;

  RegisteredRetakeData({
    required this.refNo,
    required this.program,
    required this.stage,
  });
}

class RetakesMissedPapersScreen extends StatelessWidget {
  final List<RetakeSubmissionData> submissions = [
    RetakeSubmissionData(refNo: 'SRA243026', program: 'BSCS', stage: 'Y2S1'),
    RetakeSubmissionData(refNo: 'SRJ250992', program: 'BSCS', stage: 'Y2S1'),
  ];

  final List<RegisteredRetakeData> registeredRetakes = [
    RegisteredRetakeData(refNo: 'RMT24A0184', program: 'BSCS', stage: 'Y1S1'),
    RegisteredRetakeData(refNo: 'RMT24A0185', program: 'BSCS', stage: 'Y1S2'),
    RegisteredRetakeData(refNo: 'RMT25J0124', program: 'BSCS', stage: 'Y1S2'),
  ];

  RetakesMissedPapersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Retakes / Missed Papers'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Submit'),
              Tab(text: 'Registered'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: submissions.length,
              itemBuilder: (context, index) {
                final sub = submissions[index];
                return ListTile(
                  title: Text('${sub.refNo} - ${sub.program}'),
                  subtitle: Text('Stage: ${sub.stage}'),
                );
              },
            ),
            ListView.builder(
              itemCount: registeredRetakes.length,
              itemBuilder: (context, index) {
                final reg = registeredRetakes[index];
                return ListTile(
                  title: Text('${reg.refNo} - ${reg.program}'),
                  subtitle: Text('Stage: ${reg.stage}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
