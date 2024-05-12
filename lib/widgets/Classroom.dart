import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_locales/flutter_locales.dart';

class Classroom {

  final String number;
  final double left;
  final double top;
  final double width;
  final double height;
  final IconData? icon;
  final String describe;

  Classroom({
  required this.number,
  required this.left,
  required this.top,
  required this.width,
  required this.height,
  required this.icon,
  required this.describe,
  });

  static Future<List<Classroom>> getClassroomsFromJson(String file, String floor) async {
    String data = await rootBundle.loadString('data/$file.json');
    Map<String, dynamic> jsonData = json.decode(data);
    List<dynamic> floorData = jsonData[floor] ?? [];
    return floorData
        .map((json) => Classroom._fromJson(json))
        .toList();
  }

  factory Classroom._fromJson(Map<String, dynamic> json) {
    return Classroom(
      number: json['number'],
      left: json['left'],
      top: json['top'],
      width: json['width'],
      height: json['height'],
      icon: json['icon'] != null ? _getIconData(json['icon']) : null,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: theme.size.width * 0.02,),
              Text(cl.number, style: TextStyle(
                fontSize: theme.size.width * 0.013,
                fontWeight: FontWeight.w700,),
              ),
              Icon (cl.icon, size: theme.size.width * 0.03,),
          ]),
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
                  Text('${context.localeString('office')} № $number'),
                  Text('Здесь должна быть информация честно $describe'),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const LocaleText('close'),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  static IconData? _getIconData(String iconName) {
    switch (iconName) {
      case 'laptop':
        return Icons.laptop;

      default:
        return null;
    }
  }
}