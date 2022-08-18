import 'package:flutter/material.dart';
import 'models/occurence.dart';
import 'widgets/occurence_card.dart';

void main() => runApp(const GeneralApp());

class GeneralApp extends StatelessWidget {
  const GeneralApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _occurences = [
    Occurence(
      id: 1,
      title: 'Bought an controller',
      value: 180.00,
      text: 'Bought a controller for my PC',
      date: DateTime.now()
    ),
    Occurence(
      id: 2,
      title: 'Refunded my controller',
      text: 'It broke',
      date: DateTime.now()
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General-Purposes App')
      ),
      body: Column(
        children: <Widget>[
          const Card(
            elevation: 5,
            child: Text('Slot 1'), 
          ),
            OccurenceCard(occurences: _occurences)
          ]
      )
    );
  }
}