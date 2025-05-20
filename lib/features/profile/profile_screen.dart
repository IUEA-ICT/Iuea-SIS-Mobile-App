import 'package:flutter/material.dart';
import 'profile_header.dart';
import 'basic_info.dart';
import 'financial_info.dart';
import 'course_details.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Champs modifiables
  String phone = '256772826718';
  String email = 'danielmugalu945@gmail.com';
  String passportNumber = 'OP1562669';
  String passportExpiry = '2028-12-18';
  String visaStatus = 'Valid';
  String visaExpiry = '2025-06-18';

  // Contrôleurs pour les champs de texte
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passportNumberController = TextEditingController();
  final TextEditingController passportExpiryController = TextEditingController();
  final TextEditingController visaStatusController = TextEditingController();
  final TextEditingController visaExpiryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.text = phone;
    emailController.text = email;
    passportNumberController.text = passportNumber;
    passportExpiryController.text = passportExpiry;
    visaStatusController.text = visaStatus;
    visaExpiryController.text = visaExpiry;
  }

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    passportNumberController.dispose();
    passportExpiryController.dispose();
    visaStatusController.dispose();
    visaExpiryController.dispose();
    super.dispose();
  }

  void saveProfile() {
    setState(() {
      phone = phoneController.text;
      email = emailController.text;
      // Les champs passport et visa ne sont pas modifiables sans PDF, donc on ne les met pas à jour ici
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false,
            );
          },
        ),
        title: const Text('Student Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveProfile,
            tooltip: 'Save',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ProfileHeader(),
          const SizedBox(height: 16),
          const BasicInfoCard(),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Contact Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 18, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email, size: 18, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 18, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      const Expanded(child: Text('Male')),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.flag, size: 18, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      const Expanded(child: Text('CG')),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.badge, size: 18, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: passportNumberController,
                          decoration: const InputDecoration(
                            labelText: 'Passport No.',
                            border: InputBorder.none,
                          ),
                          enabled: false, // Désactivé sans PDF
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 18, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: passportExpiryController,
                          decoration: const InputDecoration(
                            labelText: 'Passport Expiry',
                            border: InputBorder.none,
                          ),
                          enabled: false, // Désactivé sans PDF
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.verified, size: 18, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: visaStatusController,
                          decoration: const InputDecoration(
                            labelText: 'Visa Status',
                            border: InputBorder.none,
                          ),
                          enabled: false, // Désactivé sans PDF
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.event, size: 18, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: visaExpiryController,
                          decoration: const InputDecoration(
                            labelText: 'Visa Expiry',
                            border: InputBorder.none,
                          ),
                          enabled: false, // Désactivé sans PDF
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const FinancialInfoCard(),
          const SizedBox(height: 16),
          const CourseDetailsCard(),
        ],
      ),
    );
  }
}
