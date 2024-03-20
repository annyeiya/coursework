import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/mab');
                },
                child: Text('ГУК'),
              ),
              ElevatedButton(
                  onPressed: () {
                    //_testMethod();
                  },
                  child: Text('корпус 2')
              ),
              ElevatedButton(
                  onPressed: () {
                    //_testMethod();
                  },
                  child: Text('ЛК')
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/third_a');
                    },
                    child: Text('корпус 3а')
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/third_b');
                    },
                    child: Text('корпус 3бв')
                ),
              ]),
        ]);
  }
}