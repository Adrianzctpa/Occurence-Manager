import 'package:flutter/material.dart';
import '../models/occurence.dart';

class OccurenceCard extends StatelessWidget {
  const OccurenceCard({required this.occurences, super.key});

  final List<Occurence> occurences;

  bool checkValue(Occurence oc) {
    if (oc.value == null) return false;
    
    return true;
  } 

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = occurences.map((oc) {
      return Center(child: Card(
          child: SizedBox(
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: const EdgeInsets.all(10),
                  child: Text(oc.date.toString())
                ),
                Column(
                  children: <Widget>[
                    Text(oc.title),
                    Text(oc.text),
                    checkValue(oc) 
                    ? Text(oc.value.toString()) 
                    : const Text('No value given')
                  ]
                ),
              ]
            ),
          ),
        )
      );
    }).toList();

    return Column(
      children: <Widget>[
        ...cards
      ]
    );
  }
}