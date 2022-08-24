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
  final List<Occurence> _occurences = [];

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

  _removeOccurence(int id) {
    setState(() {
      _occurences.removeWhere((oc) {
        return oc.id == id;
      });
    });
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
            OccurenceCard(occurences: _occurences, onRemove: _removeOccurence)
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