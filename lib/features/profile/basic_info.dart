import 'package:flutter/material.dart';

class BasicInfoCard extends StatelessWidget {
  const BasicInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Basic Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 12),
            InfoRow(label: 'Registration Number', value: '24/276/BSCS-S'),
            InfoRow(label: 'Full Name', value: 'Mugalu Wa Thumba Daniel'),
            InfoRow(label: 'Program', value: 'Bachelor of Science in Computer Science (BSCS)'),
            InfoRow(label: 'Academic Award', value: 'BACHELOR'),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const InfoRow({required this.label, required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: Colors.grey))),
          const SizedBox(width: 8),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
