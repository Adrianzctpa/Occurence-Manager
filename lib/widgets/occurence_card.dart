import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            width: 500,
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15, 
                    vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 1,
                    )
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(DateFormat('d MMM y').format(oc.date),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple)
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        oc.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                      Text(
                        oc.text,
                        style: const TextStyle(
                          color: Colors.grey
                        )),
                      checkValue(oc) 
                      ? Text(oc.value!.toStringAsFixed(2)) 
                      : const Text('No value given')
                    ]
                  ),
                )
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