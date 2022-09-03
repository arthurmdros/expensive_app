import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removedTransaction;

  TransactionList(this.transactions, this.removedTransaction);

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
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                                child:
                                    Text('R\$${transactions[index].amount}'))),
                      ),
                      title: Text(transactions[index].title as String,
                          style: Theme.of(context).textTheme.titleMedium),
                      subtitle: Text(DateFormat('dd/MM/yyyy')
                          .format(transactions[index].date!)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => removedTransaction(transactions[index].id),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
