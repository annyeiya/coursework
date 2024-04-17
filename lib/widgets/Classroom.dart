import 'package:flutter/material.dart';

class Classroom {

  static Widget classroom(BuildContext context, String number,
      double left, double top, double width, double height,
      {Color color = Colors.transparent}) { //transparent

    final theme = MediaQuery.of(context);
    
    return Positioned(
      left: theme.orientation == Orientation.portrait ? theme.size.shortestSide * left : theme.size.longestSide * left,
      top: theme.orientation == Orientation.portrait ? theme.size.shortestSide * top : theme.size.longestSide * top,
      child: GestureDetector(
        onTap: () => _tapOn(context, number),
        child: Container(
          width: theme.orientation == Orientation.portrait ? theme.size.shortestSide * width : theme.size.longestSide * width,
          height: theme.orientation == Orientation.portrait ? theme.size.shortestSide * height : theme.size.longestSide * height,
          color: color,
          // child: Column(
          //   children: [
          //     SizedBox(height: theme.size.width * 0.01),
          //     Text('325', style: TextStyle(),),
          //     Icon (Icons.laptop, size: theme.size.width * 0.02,),
          // ]),
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

  static Widget building (BuildContext context, String number,
      double left, double top, double width, double height,
      {Color color = Colors.transparent}) {

    final theme = MediaQuery.of(context);
    final nav = Navigator.of(context);

    return Positioned(
      left: theme.orientation == Orientation.portrait ? theme.size.shortestSide * left : theme.size.longestSide * left,
      top: theme.orientation == Orientation.portrait ? theme.size.shortestSide * top : theme.size.longestSide * top,
      child: GestureDetector(
        onTap: () => nav.pushNamed(number),
        child: Container(
          width: theme.orientation == Orientation.portrait ? theme.size.shortestSide * width : theme.size.longestSide * width,
          height: theme.orientation == Orientation.portrait ? theme.size.shortestSide * height : theme.size.longestSide * height,

          color: color,
        ),
      ),
    );
  }

}