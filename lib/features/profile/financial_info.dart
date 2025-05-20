import 'package:flutter/material.dart';

class FinancialInfoCard extends StatelessWidget {
  const FinancialInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Financial Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 12),
            FinancialRow(label: 'Total Billed', value: '\$3,012.00'),
            FinancialRow(label: 'Total Paid', value: '\$3,112.00'),
            FinancialRow(label: 'Balance', value: '-\$100.00', valueColor: Colors.green),
          ],
        ),
      ),
    );
  }
}

class FinancialRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  const FinancialRow({required this.label, required this.value, this.valueColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: Colors.grey))),
          const SizedBox(width: 8),
          Text(value, style: TextStyle(fontWeight: FontWeight.w500, color: valueColor)),
        ],
      ),
    );
  }
}
