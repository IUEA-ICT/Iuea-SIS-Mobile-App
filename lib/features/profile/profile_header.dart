import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
              // Remplacer par une vraie image si disponible
            ),
            SizedBox(height: 12),
            Text(
              'Mugalu Wa Thumba Daniel',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Reg. No: 24/276/BSCS-S',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
