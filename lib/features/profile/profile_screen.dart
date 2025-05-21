import 'package:flutter/material.dart';
import 'profile_header.dart';
import 'basic_info.dart';
import 'contact_info.dart';
import 'financial_info.dart';
import 'course_details.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ProfileHeader(),
          SizedBox(height: 16),
          BasicInfoCard(),
          SizedBox(height: 16),
          ContactInfoCard(),
          SizedBox(height: 16),
          FinancialInfoCard(),
          SizedBox(height: 16),
          CourseDetailsCard(),
        ],
      ),
    );
  }
}
