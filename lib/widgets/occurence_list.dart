import 'package:flutter/material.dart';
import './occurence_card.dart';
import '../models/occurence.dart';

class OccurenceList extends StatelessWidget {
    const OccurenceList({
        required this.occurences, 
        required this.onRemove, 
        super.key
    });
    
    final List<Occurence> occurences;
    final void Function(int) onRemove;

    @override 
    Widget build(BuildContext context) {
      
      final noOccurences = 
      LayoutBuilder(
        builder: (ctx, constraints) {
          return Column(
            children: <Widget>[
              SizedBox(height: constraints.maxHeight * 0.05),
              const Text(
                'No occurences!'
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              SizedBox(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ]
          );
        }
      );

      return Center(
      child: occurences.isEmpty 
      ? noOccurences
      : ListView.builder(
          itemCount: occurences.length,
          itemBuilder: (ctx, i) {
            final oc = occurences[i];
            return OccurenceCard(
              key: GlobalObjectKey(oc.id),
              occurence: oc,
              onRemove: onRemove
            );
          }
        )
      );
    }
}