import 'package:flutter/material.dart';

class OcurrenceCreate extends StatefulWidget {
  const OcurrenceCreate({required this.onSubmit, super.key});

  final void Function(String, String, double?) onSubmit;

  @override
  State<OcurrenceCreate> createState() => _OcurrenceCreateState();
}

class _OcurrenceCreateState extends State<OcurrenceCreate> {
  final titleController = TextEditingController();
  final detailController = TextEditingController();
  final valueController = TextEditingController();

  void _handleSubmit() {
    final String title = titleController.text;
    final String detail = detailController.text;
    final double value = double.tryParse(valueController.text) ?? 0;
    
    if (title.isEmpty || detail.isEmpty) {
      return;
    }

    widget.onSubmit(title, detail, value);
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
            ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.purple,
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