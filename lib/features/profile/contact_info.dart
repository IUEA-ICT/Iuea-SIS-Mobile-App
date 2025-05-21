import 'package:flutter/material.dart';

class ContactInfoCard extends StatefulWidget {
  const ContactInfoCard({Key? key}) : super(key: key);

  @override
  State<ContactInfoCard> createState() => _ContactInfoCardState();
}

class _ContactInfoCardState extends State<ContactInfoCard> {
  String phone = '256772826718';
  String email = 'danielmugalu945@gmail.com';

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
            // Phone (éditable)
            Row(
              children: [
                const Icon(Icons.phone, size: 18, color: Colors.blueGrey),
                const SizedBox(width: 8),
                const Text('Phone:', style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(phone, style: const TextStyle(fontSize: 15)),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
                  tooltip: "Edit phone",
                  onPressed: () async {
                    final result = await showDialog<String>(
                      context: context,
                      builder: (context) {
                        final controller = TextEditingController(text: phone);
                        return AlertDialog(
                          title: const Text('Edit Phone'),
                          content: TextField(
                            controller: controller,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: 'Phone',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, controller.text),
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                    if (result != null && result.trim().isNotEmpty && result != phone) {
                      setState(() => phone = result.trim());
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Email (éditable)
            Row(
              children: [
                const Icon(Icons.email, size: 18, color: Colors.blueGrey),
                const SizedBox(width: 8),
                const Text('Email:', style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(email, style: const TextStyle(fontSize: 15)),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
                  tooltip: "Edit email",
                  onPressed: () async {
                    final result = await showDialog<String>(
                      context: context,
                      builder: (context) {
                        final controller = TextEditingController(text: email);
                        return AlertDialog(
                          title: const Text('Edit Email'),
                          content: TextField(
                            controller: controller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, controller.text),
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                    if (result != null && result.trim().isNotEmpty && result != email) {
                      setState(() => email = result.trim());
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Gender (non éditable)
            Row(
              children: const [
                Icon(Icons.person, size: 18, color: Colors.blueGrey),
                SizedBox(width: 8),
                Text('Gender:', style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 8),
                Expanded(child: Text('Male', style: TextStyle(fontSize: 15))),
                Icon(Icons.edit, size: 18, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 8),
            // Nationality (non éditable)
            Row(
              children: const [
                Icon(Icons.flag, size: 18, color: Colors.blueGrey),
                SizedBox(width: 8),
                Text('Nationality:', style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 8),
                Expanded(child: Text('CG', style: TextStyle(fontSize: 15))),
                Icon(Icons.edit, size: 18, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 8),
            // Passport No. (non éditable)
            Row(
              children: const [
                Icon(Icons.badge, size: 18, color: Colors.blueGrey),
                SizedBox(width: 8),
                Text('Passport No.:', style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 8),
                Expanded(child: Text('OP1562669', style: TextStyle(fontSize: 15))),
                Icon(Icons.edit, size: 18, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 8),
            // Passport Expiry (non éditable)
            Row(
              children: const [
                Icon(Icons.calendar_today, size: 18, color: Colors.blueGrey),
                SizedBox(width: 8),
                Text('Passport Expiry:', style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 8),
                Expanded(child: Text('2028-12-18', style: TextStyle(fontSize: 15))),
                Icon(Icons.edit, size: 18, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 8),
            // Visa Status (non éditable)
            Row(
              children: const [
                Icon(Icons.verified, size: 18, color: Colors.blueGrey),
                SizedBox(width: 8),
                Text('Visa Status:', style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 8),
                Expanded(child: Text('Valid', style: TextStyle(fontSize: 15))),
                Icon(Icons.edit, size: 18, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 8),
            // Visa Expiry (non éditable)
            Row(
              children: const [
                Icon(Icons.event, size: 18, color: Colors.blueGrey),
                SizedBox(width: 8),
                Text('Visa Expiry:', style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 8),
                Expanded(child: Text('2025-06-18', style: TextStyle(fontSize: 15))),
                Icon(Icons.edit, size: 18, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
