import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/occurence.dart';

class OccurenceCard extends StatefulWidget {
  const OccurenceCard({
    required this.occurence, 
    required this.onRemove, 
    super.key
  });

  final Occurence occurence;
  final void Function(int id) onRemove;

  @override
  State<OccurenceCard> createState() => _OccurenceCardState();
}

class _OccurenceCardState extends State<OccurenceCard> {
  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
  ];

  Color? _bgColor;

  @override 
  void initState () {
    super.initState();

    int i = Random().nextInt(colors.length);
    _bgColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    final oc = widget.occurence;

    return Card(
      child: Stack(
        children: <Widget>[ 
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15, 
                  vertical: 10
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _bgColor as Color,
                    width: 1,
                  )
                ),
                padding: const EdgeInsets.all(10),
                child: Text(DateFormat('d MMM y').format(oc.date),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _bgColor as Color,
                  )
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      oc.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )
                    ),
                    Text(
                      oc.text,
                      style: const TextStyle(
                        color: Colors.grey
                      )
                    ),
                    Text(oc.value.toStringAsFixed(2)),
                  ]
                ),
              ),
            ]
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              color: Colors.red,
              onPressed: () {
                widget.onRemove(oc.id);
              },
              icon: const Icon(Icons.delete)
            )
          )
        ]
      ),
    );
  }
}