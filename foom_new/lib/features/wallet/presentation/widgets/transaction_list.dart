import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          const ListTile(
            title: Text(
              'Transaction History',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ...transactions.map((tx) {
            return ListTile(
              leading: Icon(
                tx['type'] == 'Deposit'
                    ? Icons.arrow_downward
                    : Icons.arrow_upward,
                color: tx['type'] == 'Deposit' ? Colors.green : Colors.red,
              ),
              title: Text(tx['type']),
              trailing: Text('${tx['amount']} Tokens'),
            );
          }).toList(),
        ],
      ),
    );
  }
}
