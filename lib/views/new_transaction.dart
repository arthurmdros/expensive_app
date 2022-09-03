import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function callsAddTransaction;

  NewTransaction(this.callsAddTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // String titleInput = '';
  final _titleCrontoller = TextEditingController();

  final _amountController = TextEditingController();

  void submitData() {
    final enteredTitle = _titleCrontoller.text;
    final enteredAmount = double.parse(_amountController.text.toString());
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.callsAddTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));
  }

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
            onSubmitted: (_) => submitData(),
            // onChanged: (value) => titleInput = value
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Valor'),
            controller: _amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData(),
            // onChanged: (value) => amountInput = value
          ),
          Row(
            children: [
              Text(
                'Nenhuma data selecionada!',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              TextButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: _presentDatePicker,
                child: Icon(Icons.calendar_today,
                    color: Theme.of(context).primaryColor),
              )
            ],
          ),
          ElevatedButton(
              onPressed: submitData,
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor),
              child: const Text(
                'Salvar',
                style: TextStyle(color: Colors.white),
              ))
        ]),
      ),
    );
  }
}
