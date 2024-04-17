import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Classroom {

  final String number;
  final double left;
  final double top;
  final double width;
  final double height;
  final String describe;

  Classroom({
  required this.number,
  required this.left,
  required this.top,
  required this.width,
  required this.height,
  required this.describe,
  });

  static Future<List<Classroom>> getClassroomsFromJson(BuildContext context, String file, String floor) async {
    String data = await rootBundle.loadString('data/$file.json');
    Map<String, dynamic> jsonData = json.decode(data);
    List<dynamic> floorData = jsonData[floor] ?? [];
    return floorData
        .map((json) => Classroom.fromJson(json))
        .toList();
  }

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return Classroom(
      number: json['number'],
      left: json['left'],
      top: json['top'],
      width: json['width'],
      height: json['height'],
      describe: json['describe'],
    );
  }


  static Widget classroom(BuildContext context, Classroom cl, {Color color = Colors.transparent}) { //transparent
    final theme = MediaQuery.of(context);
    return Positioned(
      left: theme.orientation == Orientation.portrait ? theme.size.shortestSide * cl.left : theme.size.longestSide * cl.left,
      top: theme.orientation == Orientation.portrait ? theme.size.shortestSide * cl.top : theme.size.longestSide * cl.top,
      child: GestureDetector(
        onTap: () => _tapOn(context, cl.number, cl.describe),
        child: Container(
          width: theme.orientation == Orientation.portrait ? theme.size.shortestSide * cl.width : theme.size.longestSide * cl.width,
          height: theme.orientation == Orientation.portrait ? theme.size.shortestSide * cl.height : theme.size.longestSide * cl.height,
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

  static void _tapOn(BuildContext context, String number, String describe) {
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
                  Text('Здесь должна быть информация честно $describe'),
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