import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';
import '../../config/constants.dart';
import '../academics/retakes_missed_papers.dart';
import '../academics/student_id.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home', style: TextStyle(fontSize: 22))),
    Center(child: Text('Financials', style: TextStyle(fontSize: 22))),
    Center(child: Text('Examinations', style: TextStyle(fontSize: 22))),
    Center(child: Text('Hostel', style: TextStyle(fontSize: 22))),
  ];

  Widget _buildAcademicsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Box Student ID
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.badge, color: Colors.blue),
                    title: Text('Student ID'),
                  ),
                  const Divider(),
                  // Affiche le contenu StudentIDScreen sans Scaffold
                  const StudentIDScreen(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Box Retakes / Missed Papers
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.replay_circle_filled, color: Colors.orange),
                    title: Text('Retakes / Missed Papers'),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 350, // Limite la hauteur pour éviter overflow
                    child: RetakesMissedPapersScreen(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Retour système : quitte l'application
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => // Hamburger menu
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: const Text('Dashboard'),
          actions: [
            IconButton(
              icon: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
                radius: 16,
              ),
              tooltip: 'Profile',
              onPressed: _openProfile,
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColors.darkRed,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo_iuea.jpg'),
                      radius: 32,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Mugalu Wa Thumba Daniel',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      '24/276/BSCS-S',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Dashboard'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _selectedIndex = 0);
                },
              ),
              ExpansionTile(
                leading: const Icon(Icons.school),
                title: const Text('Academics'),
                children: [
                  ListTile(
                    title: const Text('Course Unit Registration'),
                    onTap: () {
                      // TODO: Naviguer vers Course Unit Registration
                    },
                  ),
                  ListTile(
                    title: const Text('Registered Courses'),
                    onTap: () {
                      // TODO: Naviguer vers Registered Courses
                    },
                  ),
                  ListTile(
                    title: const Text('Retake / Missed Paper'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RetakesMissedPapersScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Course Evaluation'),
                    onTap: () {
                      // TODO: Naviguer vers Course Evaluation
                    },
                  ),
                  ListTile(
                    title: const Text('Student ID'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const StudentIDScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Retakes'),
                    onTap: () {
                      // TODO: Naviguer vers Retakes
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: const Icon(Icons.payments),
                title: const Text('Financials'),
                children: [
                  ListTile(
                    title: const Text('Fees Payment Receipt'),
                    onTap: () {
                      // TODO: Naviguer vers Fees Payment Receipt
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: const Icon(Icons.assignment),
                title: const Text('Examinations'),
                children: [
                  ListTile(
                    title: const Text('Exam Card'),
                    onTap: () {
                      // TODO: Naviguer vers Exam Card
                    },
                  ),
                  ListTile(
                    title: const Text('Exam Results'),
                    onTap: () {
                      // TODO: Naviguer vers Exam Results
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: const Icon(Icons.hotel),
                title: const Text('Hostel Booking'),
                children: [
                  ListTile(
                    title: const Text('Book'),
                    onTap: () {
                      // TODO: Naviguer vers Book Hostel
                    },
                  ),
                  ListTile(
                    title: const Text('My Bookings'),
                    onTap: () {
                      // TODO: Naviguer vers My Bookings
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: const Icon(Icons.verified),
                title: const Text('Clearance'),
                children: [
                  ListTile(
                    title: const Text('Graduation Clearance Status'),
                    onTap: () {
                      // TODO: Naviguer vers Graduation Clearance Status
                    },
                  ),
                ],
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                  _openProfile();
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
        body: _selectedIndex == 1
            ? _buildAcademicsPage()
            : _selectedIndex == 0
                ? _pages[0]
                : _selectedIndex == 2
                    ? _pages[1]
                    : _selectedIndex == 3
                        ? _pages[2]
                        : _pages[3],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.darkRed,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Academics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payments),
              label: 'Financials',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Exams',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.hotel),
              label: 'Hostel',
            ),
          ],
        ),
      ),
    );
  }
}
