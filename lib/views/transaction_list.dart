import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget { 
  final List<Transaction> transactions;

  TransactionList(this.transactions);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
            child: Row(
          children: [
            Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2)),
                padding: const EdgeInsets.all(10),
                child: Text(
                  'R\$ ${tx.amount}',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title as String,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(tx.date!),
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
