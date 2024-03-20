import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/mab');
            },
            child: Text('ГУК'),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text('корпус 2')
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text('ЛК')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/third_a');
              },
              child: Text('корпус 3а')
          ),
        ]);
  }
}