import 'package:flutter/material.dart';
import '../models/occurence.dart';
import 'occurence_card.dart';
import 'occurence_create.dart';

class OccurenceUser extends StatefulWidget {
  const OccurenceUser({super.key});

  @override
  OccurenceUserState createState() => OccurenceUserState();
}

class OccurenceUserState extends State<OccurenceUser> {
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
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OcurrenceCreate(onSubmit: _addOccurence),
        OccurenceCard(occurences: _occurences),
      ]
    );
  }
}