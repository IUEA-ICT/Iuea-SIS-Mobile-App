import 'package:flutter/material.dart';

class StudentIDScreen extends StatelessWidget {
  const StudentIDScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder for student ID card
    return Scaffold(
      appBar: AppBar(title: const Text('Student ID')),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(32),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.account_circle, size: 80, color: Colors.blue),
                SizedBox(height: 16),
                Text('Student Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('ID: 123456789'),
                SizedBox(height: 8),
                Text('Programme: BSCS'),
                SizedBox(height: 8),
                Text('Stage: Y2S1'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
