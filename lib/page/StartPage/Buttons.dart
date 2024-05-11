import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../OverPage/CorpusPage.dart';

class Buttons {

  final String name;
  final double left;
  final double top;
  final double width;
  final double height;

  Buttons({
    required this.name,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  static Future<List<Buttons>> getButtonsFromJson(BuildContext context, String file) async {
    String data = await rootBundle.loadString('data/$file.json');
    List<dynamic> jsonData = json.decode(data);
    return jsonData.map((json) => Buttons._fromJson(json)).toList();
  }

  factory Buttons._fromJson(Map<String, dynamic> json) {
    return Buttons(
      name: json['name'],
      left: json['left'],
      top: json['top'],
      width: json['width'],
      height: json['height'],
    );
  }


  static Widget building (BuildContext context, Buttons bt, {Color color = Colors.transparent }) {

    final theme = MediaQuery.of(context);

    return Positioned(
      left: theme.orientation == Orientation.portrait ? theme.size.shortestSide * bt.left : theme.size.longestSide * bt.left,
      top: theme.orientation == Orientation.portrait ? theme.size.shortestSide * bt.top : theme.size.longestSide * bt.top,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CorpusPage(name: bt.name)),
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