import 'package:flutter/material.dart';

class Classroom {

  static Widget classroom(BuildContext context, String number,
      double vLeft, double vTop, double vWeidth, double vHeight,
      double gLeft, double gTop, double gWeidth, double gHeight,
      {Color color = Colors.transparent}) {

    final theme = MediaQuery.of(context);
    
    return Positioned(
      left: theme.orientation == Orientation.portrait ? vLeft : gLeft,
      top: theme.orientation == Orientation.portrait ? vTop : gTop,
      child: GestureDetector(
        onTap: () => _tapOn(context, number),
        child: Container(
          width: theme.orientation == Orientation.portrait ? vWeidth : gWeidth,
          height: theme.orientation == Orientation.portrait ? vHeight : gHeight,
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