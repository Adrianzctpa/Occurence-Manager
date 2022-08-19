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
      text: 'It broke',
      date: DateTime.now()
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OccurenceCard(occurences: _occurences),
        const OcurrenceCreate()
      ]
    );
  }
}