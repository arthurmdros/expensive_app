import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Mesa nova',
      amount: 239,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Mousepad gamer',
      amount: 35,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    var random = Random.secure();

    var valueId = utf8.encode(random.nextInt(1000000).toString());

    final newTx = Transaction(
        id: sha256.convert(valueId).toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransactions)
    ]);
  }
}
