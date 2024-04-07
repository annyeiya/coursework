import 'package:flutter/material.dart';

class Classroom {

  static Widget classroom(BuildContext context, String number,
      double left, double top, double weidth, double height,
      {Color color = Colors.amber}) { //transparent

    final theme = MediaQuery.of(context);
    
    return Positioned(
      left: theme.orientation == Orientation.portrait ? theme.size.shortestSide * left : theme.size.longestSide * left,
      top: theme.orientation == Orientation.portrait ? theme.size.shortestSide * top : theme.size.longestSide * top,
      child: GestureDetector(
        onTap: () => _tapOn(context, number),
        child: Container(
          width: theme.orientation == Orientation.portrait ? theme.size.shortestSide * weidth : theme.size.longestSide * weidth,
          height: theme.orientation == Orientation.portrait ? theme.size.shortestSide * height : theme.size.longestSide * height,
          color: color,
        ),
      ),
    );
  }

  static void _tapOn(BuildContext context, String number) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Кабинет № $number'),
                  const Text('Здесь должна быть информация честно'),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Закрыть'),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}