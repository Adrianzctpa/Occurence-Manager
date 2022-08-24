import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/occurence.dart';

class OccurenceCard extends StatelessWidget {
  const OccurenceCard({
    required this.occurences, 
    required this.onRemove, 
    super.key
  });

  final List<Occurence> occurences;
  final void Function(int id) onRemove;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 500,
        child: occurences.isEmpty 
        ? Column(
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'No occurences!'
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ]
          )
        : ListView.builder(
            itemCount: occurences.length, 
            itemBuilder: (ctx, i) {
              final Occurence oc = occurences[i];
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
                              color: Theme.of(context).primaryColor,
                              width: 1,
                            )
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(DateFormat('d MMM y').format(oc.date),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
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
                          onRemove(oc.id);
                        },
                        icon: const Icon(Icons.delete)
                      )
                    )
                  ]
                ),
              );
            }
          ),
      ),
    );
  }
}