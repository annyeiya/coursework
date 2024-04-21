import 'package:flutter/material.dart';

import '../../widgets/Building.dart';
import 'ImageBuilder.dart';


class CorpusPage extends StatefulWidget {
  const CorpusPage({super.key, this.numberFloor, required this.name});

  final String? numberFloor;
  final String name;

  @override
  State<CorpusPage> createState() => _CorpusPage();
}

class _CorpusPage extends State<CorpusPage> {

  late Map<String, String> imageMap;
  late String name;
  String? numberFloor;
  late String? jsonFile;

  @override
  void initState () {
    super.initState();
    name = widget.name;
    imageMap = Building.naming[name]![1] as Map<String, String>;
    numberFloor = widget.numberFloor ?? imageMap.keys.first;
    jsonFile = Building.jsonFiles[name];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(Building.naming[name]![0] as String),
        centerTitle: true,
        ),

      body: SingleChildScrollView (
        child: Column(
          children: [
            const SizedBox(height: 60.0),
            Center (
              child: SizedBox (
                height: 30,
                width: 50,
                child: DropdownButton<String>(
                  value: numberFloor,
                  icon: const Icon(Icons.keyboard_arrow_right_outlined),
                  underline: Container(height: 0,),
                  isExpanded: true,
                  iconSize: 24,
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                  onChanged: (String? newValue) {
                    setState(() {
                      numberFloor = newValue!;
                    });
                  },
                  items: imageMap.keys.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            ImageBuilder(numberFloor: numberFloor, imageMap: imageMap, jsonFile: jsonFile,),
            const SizedBox(height: 40.0),
          ]
        ),
      ),
    );
  }
}
