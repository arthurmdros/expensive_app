import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key}) : super(key: key);


  // String titleInput = '';
  // String amountInput = '';

  // THERE IS ANOTHER WAY TO GET VALUE OF TEXTFIELD INPUT
  final _titleCrontoller = TextEditingController();
  final _amountController = TextEditingController();

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
                print(_titleCrontoller.text);
                print(_amountController.text);
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
