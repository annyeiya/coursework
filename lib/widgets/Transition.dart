import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../page/OverPage/CorpusPage.dart';



class Transition {

  final String name;
  final String floor;
  final double left;
  final double top;
  final double width;
  final double height;

  Transition({
    required this.name,
    required this.floor,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  static Future<List<Transition>> getTransitionFromJson(BuildContext context, String file, String floor) async {
    String data = await rootBundle.loadString('data/$file.json');
    Map<String, dynamic> jsonData = json.decode(data);
    List<dynamic> floorData = jsonData["-1"][floor] ?? [];

    return floorData
        .map((json) => Transition.fromJson(json))
        .toList();
  }

  factory Transition.fromJson(Map<String, dynamic> json) {
    return Transition(
      name: json['name'],
      floor: json['floor'],
      left: json['left'],
      top: json['top'],
      width: json['width'],
      height: json['height'],
    );
  }


  static Widget building (BuildContext context, Transition bt, {Color color = Colors.transparent}) {

    final theme = MediaQuery.of(context);

    return Positioned(
      left: theme.orientation == Orientation.portrait ? theme.size.shortestSide * bt.left : theme.size.longestSide * bt.left,
      top: theme.orientation == Orientation.portrait ? theme.size.shortestSide * bt.top : theme.size.longestSide * bt.top,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CorpusPage(name: bt.name, numberFloor: bt.floor,)),
          );
        },
        child: Container(
          width: theme.orientation == Orientation.portrait ? theme.size.shortestSide * bt.width : theme.size.longestSide * bt.width,
          height: theme.orientation == Orientation.portrait ? theme.size.shortestSide * bt.height : theme.size.longestSide * bt.height,

          color: color,
        ),
      ),
    );
  }
}