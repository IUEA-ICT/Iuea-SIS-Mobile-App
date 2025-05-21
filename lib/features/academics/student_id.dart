import 'package:flutter/material.dart';

class StudentIDScreen extends StatelessWidget {
  const StudentIDScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo rectangulaire de l'université
              Container(
                width: 300,
                height: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: Image.asset(
                  'assets/images/logo_iuea_2.png', // Place ton logo ici
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              // Photo de profil ronde de l'étudiant
              const CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage('assets/images/avatar.jpg'), // Remplace par la photo de l'étudiant
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 18),
              // Nom de l'étudiant
              const Text(
                'Mugalu Wa Thumba Daniel',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // Registration number
              const Text(
                'Reg. No: 24/276/BSCS-S',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              // Faculté
              const Text(
                'Faculty: Computer Science',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 10),
              // Texte institutionnel
              const Text(
                'This card remains property of\nINTERNATIONAL UNIVERSITY OF EAST AFRICA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
