import 'package:flutter/material.dart';

class GraphBar extends StatelessWidget {
  const GraphBar({
      required this.day,
      required this.value,
      required this.percentage,
      super.key
  });

  final String day;
  final double value;
  final double percentage;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: FittedBox(
            child: Text(value.toStringAsFixed(2))
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                )
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  )
                )
              )
            ]
          )
        ),
        const SizedBox(height: 5),
        Text(day),
      ]
    );
  }
}