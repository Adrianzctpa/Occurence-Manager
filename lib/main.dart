import 'package:flutter/material.dart';

import 'models/occurence.dart';
import 'widgets/occurence_graph.dart';
import 'widgets/occurence_create.dart';
import 'widgets/occurence_list.dart';

void main() => runApp(const GeneralApp());

class GeneralApp extends StatelessWidget {
  const GeneralApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight
    // ]);
    
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
    // Occurence(id: 1, title: 'a', text: 'a', value: 0.00, date: DateTime.now()),
    // Occurence(id: 2, title: 'a', text: 'a', value: 0.00, date: DateTime.now()),
    // Occurence(id: 3, title: 'a', text: 'a', value: 0.00, date: DateTime.now()),
    // Occurence(id: 4, title: 'a', text: 'a', value: 0.00, date: DateTime.now()),
    // Occurence(id: 5, title: 'a', text: 'a', value: 0.00, date: DateTime.now()),
    // Occurence(id: 7, title: 'a', text: 'a', value: 0.00, date: DateTime.now()),
    // Occurence(id: 6, title: 'a', text: 'a', value: 0.00, date: DateTime.now()),
    // Occurence(id: 8, title: 'a', text: 'a', value: 0.00, date: DateTime.now()),
    // Occurence(id: 9, title: 'a', text: 'a', value: 0.00, date: DateTime.now()),
    // Occurence(id: 10, title: 'a', text: 'a', value: 0.00, date: DateTime.now()),
    // Occurence(id: 11, title: 'a', text: 'a', value: 0.00, date: DateTime.now()) 
  ];
  bool _showGraph = false;

  List<Occurence> get _recentOccurences {
    return _occurences.where((occ) {
      return occ.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  } 

  void _addOccurence(String title, String detail, double value, DateTime date) {
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

  void _removeOccurence(int id) {
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
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final AppBar appbar = AppBar(
      title: const Text('General-Purposes App'),
      actions: <Widget>[
        if (isLandscape)
        IconButton(
          icon: const Icon(Icons.change_circle),
          onPressed: () => setState(() {
            _showGraph = !_showGraph;
          })
        ),
        IconButton(
          icon: const Icon(Icons.add_box_outlined),
          onPressed: () => _openOccurenceCreateModal(context)
        )
      ]
    );

    final double avHeight = MediaQuery.of(context).size.height 
    - appbar.preferredSize.height 
    - MediaQuery.of(context).padding.top;
    
    final body = SingleChildScrollView(
      child: Column(
        children: <Widget>[
          if (_showGraph || !isLandscape)
          SizedBox(
            height: avHeight * (isLandscape ? 0.7 : 0.3), 
            child: OccurenceGraph(
              recentOccurences: _recentOccurences
            )
          ),
          if (!_showGraph || !isLandscape)
          SizedBox(
            height: avHeight * 0.70,
            child: OccurenceList(
              occurences: _occurences, 
              onRemove: _removeOccurence
            )
          )
        ]
      ),
    );

    return Scaffold(
      appBar: appbar,
      body: body,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openOccurenceCreateModal(context)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}