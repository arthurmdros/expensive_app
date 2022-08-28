import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // String titleInput = '';
  // String amountInput = '';

  // THERE IS ANOTHER WAY TO GET VALUE OF TEXTFIELD INPUT
  final _titleCrontoller = TextEditingController();
  final _amountController = TextEditingController();

  final Function callsAddTransaction;

  NewTransaction(this.callsAddTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Despesa'),
            controller: _titleCrontoller,
            // onChanged: (value) => titleInput = value
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Valor'),
            controller: _amountController,
            // onChanged: (value) => amountInput = value
          ),
          ElevatedButton(
              onPressed: () {
                callsAddTransaction(_titleCrontoller.text, double.parse(_amountController.text.toString()));
              },
              style: ElevatedButton.styleFrom(primary: Colors.white),
              child: Text(
                'Salvar',
                style: TextStyle(color: Colors.purple),
              ))
        ]),
      ),
    );
  }
}
