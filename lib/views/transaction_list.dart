import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    'Não existe despesas cadastradas!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColorDark,
                                  width: 2)),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'R\$ ${transactions[index].amount!.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColorDark,
                                fontWeight: FontWeight.bold),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transactions[index].title as String,
                              style: Theme.of(context).textTheme.titleMedium
                              // const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                          Text(
                            DateFormat('dd/MM/yyyy')
                                .format(transactions[index].date!),
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ));
                },
                itemCount: transactions.length,
              ));
  }
}
