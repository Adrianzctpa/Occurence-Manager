import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OcurrenceCreate extends StatefulWidget {
  const OcurrenceCreate({required this.onSubmit, super.key});

  final void Function(String, String, double?, DateTime) onSubmit;

  @override
  State<OcurrenceCreate> createState() => _OcurrenceCreateState();
}

class _OcurrenceCreateState extends State<OcurrenceCreate> {
  final titleController = TextEditingController();
  final detailController = TextEditingController();
  final valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _handleSubmit() {
    final String title = titleController.text;
    final String detail = detailController.text;
    final double value = double.tryParse(valueController.text) ?? 0;

    if (title.isEmpty || detail.isEmpty) {
      return;
    }

    widget.onSubmit(title, detail, value, _selectedDate);
  }

  void _showDateForm() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2010), 
      lastDate: DateTime.now()
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
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              maxLength: 50,
              controller: titleController,
              onSubmitted: (_) =>_handleSubmit(),
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              maxLength: 50,
              controller: detailController,
              onSubmitted: (_) =>_handleSubmit(),
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Detail',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: valueController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) =>_handleSubmit(),
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Value',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(DateFormat('d MMM y').format(_selectedDate)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.purple,
                  ),
                  onPressed: _showDateForm,
                  child: const Text(
                    'Select Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                )
              ]
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                textStyle: const TextStyle(
                  fontSize: 20, 
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                side: const BorderSide(
                  width: 1.0,
                  color: Colors.purple
                )
              ),
              child: const Text('Create'),
            ),
          ],
        )
      )
    );
  }
}