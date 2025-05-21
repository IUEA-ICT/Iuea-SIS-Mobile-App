import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContactInfoCard extends StatefulWidget {
  const ContactInfoCard({Key? key}) : super(key: key);

  @override
  State<ContactInfoCard> createState() => _ContactInfoCardState();
}

class _ContactInfoCardState extends State<ContactInfoCard> {
  String phone = '256772826718';
  String email = 'danielmugalu945@gmail.com';
  String nationality = 'CG';
  String passportNo = 'OP1562669';
  DateTime passportExpiry = DateTime(2028, 12, 18);
  DateTime visaExpiry = DateTime(2025, 6, 18);

  String get visaStatus {
    final now = DateTime.now();
    return visaExpiry.isAfter(now) ? 'Valid' : 'Expired';
  }

  Future<void> _showEditDialog({
    required String title,
    required String initialValue,
    required ValueChanged<String> onSaved,
    TextInputType keyboardType = TextInputType.text,
  }) async {
    final controller = TextEditingController(text: initialValue);
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit $title'),
        content: TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(labelText: title),
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
      ),
    );
    if (result != null && result.trim().isNotEmpty && result != initialValue) {
      onSaved(result.trim());
    }
  }

  Future<void> _showEditDateDialog({
    required String title,
    required DateTime initialDate,
    required ValueChanged<DateTime> onSaved,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != initialDate) {
      onSaved(picked);
    }
  }

  void _showAttachDialog(String field) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Submit a PDF document for $field (simulation)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd');
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
                Expanded(child: Text(phone, style: const TextStyle(fontSize: 15))),
                IconButton(
                  icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
                  tooltip: "Edit phone",
                  onPressed: () => _showEditDialog(
                    title: 'Phone',
                    initialValue: phone,
                    keyboardType: TextInputType.phone,
                    onSaved: (val) => setState(() => phone = val),
                  ),
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
                Expanded(child: Text(email, style: const TextStyle(fontSize: 15))),
                IconButton(
                  icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
                  tooltip: "Edit email",
                  onPressed: () => _showEditDialog(
                    title: 'Email',
                    initialValue: email,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (val) => setState(() => email = val),
                  ),
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
            // Nationality (éditable + document)
            Row(
              children: [
                const Icon(Icons.flag, size: 18, color: Colors.blueGrey),
                const SizedBox(width: 8),
                const Text('Nationality:', style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                Expanded(child: Text(nationality, style: const TextStyle(fontSize: 15))),
                IconButton(
                  icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
                  tooltip: "Edit nationality",
                  onPressed: () => _showEditDialog(
                    title: 'Nationality',
                    initialValue: nationality,
                    onSaved: (val) => setState(() => nationality = val),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file, size: 18, color: Colors.orange),
                  tooltip: "Submit document for nationality",
                  onPressed: () => _showAttachDialog('Nationality'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Passport No. (éditable + document)
            Row(
              children: [
                const Icon(Icons.badge, size: 18, color: Colors.blueGrey),
                const SizedBox(width: 8),
                const Text('Passport No.:', style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                Expanded(child: Text(passportNo, style: const TextStyle(fontSize: 15))),
                IconButton(
                  icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
                  tooltip: "Edit passport number",
                  onPressed: () => _showEditDialog(
                    title: 'Passport No.',
                    initialValue: passportNo,
                    onSaved: (val) => setState(() => passportNo = val),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file, size: 18, color: Colors.orange),
                  tooltip: "Submit document for passport number",
                  onPressed: () => _showAttachDialog('Passport No.'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Passport Expiry (éditable + document)
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18, color: Colors.blueGrey),
                const SizedBox(width: 8),
                const Text('Passport Expiry:', style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                Expanded(child: Text(dateFormat.format(passportExpiry), style: const TextStyle(fontSize: 15))),
                IconButton(
                  icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
                  tooltip: "Edit passport expiry date",
                  onPressed: () => _showEditDateDialog(
                    title: 'Passport Expiry',
                    initialDate: passportExpiry,
                    onSaved: (val) => setState(() => passportExpiry = val),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file, size: 18, color: Colors.orange),
                  tooltip: "Submit document for passport expiry",
                  onPressed: () => _showAttachDialog('Passport Expiry'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Visa Status (non éditable, calculé)
            Row(
              children: [
                const Icon(Icons.verified, size: 18, color: Colors.blueGrey),
                const SizedBox(width: 8),
                const Text('Visa Status:', style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(visaStatus, style: TextStyle(fontSize: 15, color: visaStatus == 'Valid' ? Colors.green : Colors.red)),
                ),
                const Icon(Icons.edit, size: 18, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 8),
            // Visa Expiry (éditable + document)
            Row(
              children: [
                const Icon(Icons.event, size: 18, color: Colors.blueGrey),
                const SizedBox(width: 8),
                const Text('Visa Expiry:', style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                Expanded(child: Text(dateFormat.format(visaExpiry), style: const TextStyle(fontSize: 15))),
                IconButton(
                  icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
                  tooltip: "Edit visa expiry date",
                  onPressed: () => _showEditDateDialog(
                    title: 'Visa Expiry',
                    initialDate: visaExpiry,
                    onSaved: (val) => setState(() => visaExpiry = val),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file, size: 18, color: Colors.orange),
                  tooltip: "Submit document for visa expiry",
                  onPressed: () => _showAttachDialog('Visa Expiry'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
