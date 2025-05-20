import 'package:flutter/material.dart';

class CourseEvaluationData {
  final String refNo;
  final String stageCode;
  final String semesterCode;
  final String academicYear;

  CourseEvaluationData({
    required this.refNo,
    required this.stageCode,
    required this.semesterCode,
    required this.academicYear,
  });
}

class PostedEvaluationData {
  final String refNo;
  final String stageCode;
  final String semesterCode;
  final String academicYear;

  PostedEvaluationData({
    required this.refNo,
    required this.stageCode,
    required this.semesterCode,
    required this.academicYear,
  });
}

class CourseEvaluationScreen extends StatelessWidget {
  final List<CourseEvaluationData> evaluations = [
    CourseEvaluationData(refNo: 'SRA243026', stageCode: 'Y2S1', semesterCode: '1', academicYear: '2024'),
    CourseEvaluationData(refNo: 'SRJ250992', stageCode: 'Y2S1', semesterCode: '1', academicYear: '2024'),
  ];

  final List<PostedEvaluationData> postedEvaluations = [
    PostedEvaluationData(refNo: 'CE25J1001', stageCode: 'BSCS', semesterCode: 'JAN/APRIL2025', academicYear: '2024-2025'),
  ];

  CourseEvaluationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Course Evaluation'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Evaluate'),
              Tab(text: 'Posted'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: evaluations.length,
              itemBuilder: (context, index) {
                final eval = evaluations[index];
                return ListTile(
                  title: Text('${eval.refNo} - ${eval.stageCode}'),
                  subtitle: Text('Semester: ${eval.semesterCode}, Year: ${eval.academicYear}'),
                );
              },
            ),
            ListView.builder(
              itemCount: postedEvaluations.length,
              itemBuilder: (context, index) {
                final posted = postedEvaluations[index];
                return ListTile(
                  title: Text('${posted.refNo} - ${posted.stageCode}'),
                  subtitle: Text('Semester: ${posted.semesterCode}, Year: ${posted.academicYear}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
