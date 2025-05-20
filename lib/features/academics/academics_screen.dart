import 'package:flutter/material.dart';

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sections = [
      'Course Unit Registration',
      'View Registered Courses',
      'Retake / Missed Paper Requests',
      'Course Evaluation Submission',
      'Student ID Access',
      'Retake',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Academics'),
      ),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(sections[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Implement navigation to each section
            },
          );
        },
      ),
    );
  }
}
