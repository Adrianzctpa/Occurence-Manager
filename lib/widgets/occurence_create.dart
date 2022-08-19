import 'package:flutter/material.dart';

class OcurrenceCreate extends StatelessWidget {
  const OcurrenceCreate({
    this.id,
    this.title,
    this.value,
    this.text,
    this.date,
    super.key
  });

  final int? id;
  final String? title;
  final double? value;
  final String? text;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final detailController = TextEditingController();
    final valueController = TextEditingController();
    
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: detailController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Detail',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: valueController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Value',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => debugPrint('${titleController.text}, ${detailController.text}, ${valueController.text}'),
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