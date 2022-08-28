import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas pessoais'),
        ),
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: const Card(
                  child: Text('CHART!'),
                  color: Colors.blue,
                  elevation: 5,
                ),
              ),
              Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Despesa'),
                    ),
                    TextField(decoration: InputDecoration(labelText: 'Valor')),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white),
                        child: Text(
                          'Salvar',
                          style: TextStyle(color: Colors.purple),
                        ))
                  ]),
                ),
              ),
              Column(
                children: transactions.map((tx) {
                  return Card(
                      child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.purple, width: 2)),
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
              )
            ]));
  }
}
