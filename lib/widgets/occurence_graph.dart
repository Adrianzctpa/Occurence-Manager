import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/occurence.dart';
import 'graph_bar.dart';

class OccurenceGraph extends StatelessWidget {
  const OccurenceGraph({required this.recentOccurences, super.key});
  
  final List<Occurence> recentOccurences;

  List <Map<String, Object>> get onGroupOccurences {
    return List.generate(7, (i) {
      final weekDay = DateTime.now().subtract(
        Duration(days: i)
      );
      final String dayLetter = DateFormat.E().format(weekDay)[0];

      double sum = 0.0;

      for (int i = 0; i < recentOccurences.length; i++) {
        bool sameDay = recentOccurences[i].date.day == weekDay.day;
        bool sameMonth = recentOccurences[i].date.month == weekDay.month;
        bool sameYear = recentOccurences[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          sum += recentOccurences[i].value!;
        }
      }

      return {
        'day': dayLetter, 
        'value': sum
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return onGroupOccurences.fold(0.0, (sum, occ) {
      return sum + (occ['value'] as double);
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: onGroupOccurences.map((occ) {
            return Flexible(
              fit: FlexFit.tight,
              child: GraphBar(
                day: occ['day'] as String, 
                value: occ['value'] as double,
                percentage: _weekTotalValue == 0 ? 0 : (occ['value'] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      )
    );
  }
}