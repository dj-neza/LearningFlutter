import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import './adaptive_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTransaction(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 24,
            right: 24,
            left: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Add a new transaction',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 24),
              ],
            ),
            Platform.isIOS
                ? CupertinoTextField(
                    placeholder: 'Title:',
                    controller: _titleController,
                  )
                : TextField(
                    decoration: InputDecoration(labelText: 'Title:'),
                    controller: _titleController,
                  ),
            SizedBox(height: 10),
            Platform.isIOS
                ? CupertinoTextField(
                    placeholder: 'Amoint:',
                    controller: _amountController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitData(),
                  )
                : TextField(
                    decoration: InputDecoration(labelText: 'Amount:'),
                    controller: _amountController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitData(),
                  ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No date chosen!'
                        : 'Selected: ${DateFormat.yMMMd().format(_selectedDate!)}'),
                  ),
                  SizedBox(width: 10),
                  AdaptiveButton('Choose date', _showDatePicker),
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitData,
              child: Text('Add transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button!.color,
            )
          ],
        ),
      ),
    );
  }
}
