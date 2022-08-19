import 'package:flutter/material.dart';
import 'widgets/occurence_user.dart';

void main() => runApp(const GeneralApp());

class GeneralApp extends StatelessWidget {
  const GeneralApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General-Purposes App')
      ),
      body: Column(
        children: const <Widget>[
          Card(
            elevation: 5,
            child: Text('Slot 1'), 
          ),
          OccurenceUser()
        ]
      )
    );
  }
}