import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Buttons {

  final String root;
  final double left;
  final double top;
  final double width;
  final double height;

  Buttons({
    required this.root,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  });

  static Future<List<Buttons>> getButtonsFromJson(BuildContext context, String file) async {
    String data = await rootBundle.loadString('data/$file.json');
    List<dynamic> jsonData = json.decode(data);
    return jsonData
        .map((json) => Buttons.fromJson(json))
        .toList();
  }

  factory Buttons.fromJson(Map<String, dynamic> json) {
    return Buttons(
      root: json['root'],
      left: json['left'],
      top: json['top'],
      width: json['width'],
      height: json['height'],
    );
  }


  static Widget building (BuildContext context, Buttons bt, {Color color = Colors.transparent}) {

    final theme = MediaQuery.of(context);
    final nav = Navigator.of(context);

    return Positioned(
      left: theme.orientation == Orientation.portrait ? theme.size.shortestSide * bt.left : theme.size.longestSide * bt.left,
      top: theme.orientation == Orientation.portrait ? theme.size.shortestSide * bt.top : theme.size.longestSide * bt.top,
      child: GestureDetector(
        onTap: () => nav.pushNamed(bt.root),
        child: Container(
          width: theme.orientation == Orientation.portrait ? theme.size.shortestSide * bt.width : theme.size.longestSide * bt.width,
          height: theme.orientation == Orientation.portrait ? theme.size.shortestSide * bt.height : theme.size.longestSide * bt.height,

          color: color,
        ),
      ),
    );
  }
}