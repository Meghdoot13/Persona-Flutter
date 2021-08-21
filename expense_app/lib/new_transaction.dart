import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime _selectedDate;

  void submitData() {
    if(amountController.text.isEmpty){
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      titleController.text,
      double.parse(amountController.text),
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            controller: titleController,
            onSubmitted: (_) => submitData(),
            // onChanged: (val) => titleInput = val,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'amount',
            ),
            controller: amountController,
            onSubmitted: (_) => submitData(),
            // onChanged: (val) => amountInput = val,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Text(
                _selectedDate == null
                    ? 'No date chosen!'
                    : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
              ),
              SizedBox(
                width: 15,
              ),
              FlatButton(
                onPressed: _presentDatePicker,
                color: Colors.purple,
                child: Text('Choose Date'),
                textColor: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 80,),
          RaisedButton(
            color: Colors.grey[200],
            onPressed: submitData,
            child: Text(
              'Add Transaction',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            textColor: Colors.purple,
          )
        ],
      ),
    );
  }
}
