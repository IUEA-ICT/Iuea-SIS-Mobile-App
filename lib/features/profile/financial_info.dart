import 'package:flutter/material.dart';

class FinancialInfoCard extends StatelessWidget {
  const FinancialInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Financial Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            FinancialRow(
              icon: Icons.request_quote,
              iconColor: Colors.orange,
              label: 'Total Billed',
              value: '\$3,012.00',
              valueColor: Colors.orange[800],
            ),
            const Divider(height: 20, thickness: 1, color: Color(0xFFE0E0E0)),
            FinancialRow(
              icon: Icons.payments,
              iconColor: Colors.green,
              label: 'Total Paid',
              value: '\$3,112.00',
              valueColor: Colors.green[700],
            ),
            const Divider(height: 20, thickness: 1, color: Color(0xFFE0E0E0)),
            FinancialRow(
              icon: Icons.account_balance_wallet,
              iconColor: Colors.blue,
              label: 'Balance',
              value: '-\$100.00',
              valueColor: Colors.blue,
              isBold: true,
            ),
          ],
        ),
      ),
    );
  }
}

class FinancialRow extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String label;
  final String value;
  final Color? valueColor;
  final bool isBold;

  const FinancialRow({
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor,
    this.valueColor,
    this.isBold = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 10),
          Expanded(child: Text(label, style: const TextStyle(color: Colors.grey))),
          const SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: valueColor,
              fontSize: isBold ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
