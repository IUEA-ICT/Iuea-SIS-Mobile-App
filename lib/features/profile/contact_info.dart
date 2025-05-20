import 'package:flutter/material.dart';

class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Contact Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            _iconRow(Icons.phone, '256772826718'),
            _iconRow(Icons.email, 'danielmugalu945@gmail.com'),
            _iconRow(Icons.person, 'Male'),
            _iconRow(Icons.flag, 'CG'),
            _iconRow(Icons.badge, 'Passport No.: OP1562669'),
            _iconRow(Icons.calendar_today, 'Passport Expiry: 2028-12-18'),
            _iconRow(Icons.verified, 'Visa Status: Valid'),
            _iconRow(Icons.event, 'Visa Expiry: 2025-06-18'),
          ],
        ),
      ),
    );
  }

  Widget _iconRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.blueGrey),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
