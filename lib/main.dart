import 'package:flutter/material.dart';
import 'models/occurence.dart';
import 'widgets/occurence_graph.dart';
import 'widgets/occurence_card.dart';
import 'widgets/occurence_create.dart';

void main() => runApp(const GeneralApp());

class GeneralApp extends StatelessWidget {
  const GeneralApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Occurence> _occurences = [
    Occurence(
      id: 1,
      title: 'Bought an controller',
      value: 180.00,
      text: 'Bought a controller for my PC',
      date: DateTime.now().subtract(const Duration(days: 33))
    ),
    Occurence(
      id: 2,
      title: 'Refunded my controller',
      value: 20.00,
      text: 'It broke',
      date: DateTime.now().subtract(const Duration(days: 4))
    ),
    Occurence(
      id: 3,
      title: 'Refunded my controller 2',
      value: 500.00,
      text: 'It broke again',
      date: DateTime.now().subtract(const Duration(days: 3))
    ),
  ];

  List<Occurence> get _recentOccurences {
    return _occurences.where((occ) {
      return occ.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  } 

  _addOccurence(String title, String detail, double? value, DateTime date) {
    int id = _occurences.isEmpty ? 1 : (_occurences.last.id + 1);
    final Occurence occ = Occurence(
      id: id,
      title: title,
      value: value,
      text: detail,
      date: date         
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
            OccurenceGraph(recentOccurences: _recentOccurences),
            OccurenceCard(occurences: _occurences)
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