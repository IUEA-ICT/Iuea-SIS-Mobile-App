import 'package:flutter/material.dart';

class CourseDetailsCard extends StatelessWidget {
  const CourseDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Course Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            CourseRow(
              icon: Icons.calendar_month,
              iconColor: Colors.deepPurple,
              label: 'Intake Period',
              value: '(to be filled)',
            ),
            const Divider(height: 20, thickness: 1, color: Color(0xFFE0E0E0)),
            CourseRow(
              icon: Icons.timeline,
              iconColor: Colors.teal,
              label: 'Progress Semester',
              value: '(to be filled)',
            ),
            const Divider(height: 20, thickness: 1, color: Color(0xFFE0E0E0)),
            CourseRow(
              icon: Icons.school,
              iconColor: Colors.indigo,
              label: 'Progress Year',
              value: '(to be filled)',
            ),
            const Divider(height: 20, thickness: 1, color: Color(0xFFE0E0E0)),
            CourseRow(
              icon: Icons.verified_user,
              iconColor: Colors.blue,
              label: 'Student Status',
              value: '(to be filled)',
            ),
          ],
        ),
      ),
    );
  }
}

class CourseRow extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String label;
  final String value;

  const CourseRow({
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 10),
          Expanded(child: Text(label, style: const TextStyle(color: Colors.grey))),
          const SizedBox(width: 8),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
