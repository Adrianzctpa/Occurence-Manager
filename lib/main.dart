import 'package:flutter/material.dart';
import 'models/occurence.dart';
import 'widgets/occurence_card.dart';
import 'widgets/occurence_create.dart';

void main() => runApp(const GeneralApp());

class GeneralApp extends StatelessWidget {
  const GeneralApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      value: null,
      text: 'It broke',
      date: DateTime.now()
    ),
  ];

  _addOccurence(String title, String detail, double? value) {
    int id = (_occurences.last.id + 1);
    final Occurence occ = Occurence(
      id: id,
      title: title,
      value: value,
      text: detail,
      date: DateTime.now()         
    );

    setState(() {
      _occurences.add(occ);
    });

    Navigator.pop(context);
  }

  void _openOccurenceCreateModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (_) {
        return OcurrenceCreate(onSubmit: _addOccurence);
      } 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General-Purposes App'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            onPressed: () {
              _openOccurenceCreateModal(context);
            },
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Card(
              elevation: 5,
              child: Text('Slot 1'), 
            ),
             Column(
              children: <Widget>[
                OccurenceCard(occurences: _occurences),
              ]
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _openOccurenceCreateModal(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}