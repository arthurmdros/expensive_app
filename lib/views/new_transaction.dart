import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../views/adaptive_button.dart';
class NewTransaction extends StatefulWidget {
  final Function callsAddTransaction;

  NewTransaction(this.callsAddTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleCrontoller = TextEditingController();

  final _amountController = TextEditingController();

  DateTime? _selectedDate;

  void submitData() {
    final enteredTitle = _titleCrontoller.text;
    final enteredAmount = double.parse(_amountController.text.toString());
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.callsAddTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2025))
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
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
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Nenhuma data selecionada!'
                          : 'Data selecionada: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  TextButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: _presentDatePicker,
                    child: Icon(Icons.calendar_today,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            ),
            AdaptiveButton('Salvar', submitData),
          ]),
        ),
      ),
    );
  }
}
