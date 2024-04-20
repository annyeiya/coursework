import 'package:flutter/material.dart';

import '../../widgets/Building.dart';
import 'ImageBuilder.dart';


class ThirdBPage extends StatefulWidget {
  const ThirdBPage({super.key, this.numberFloor});

  final String? numberFloor;

  @override
  State<ThirdBPage> createState() => _ThirdBPage();
}

class _ThirdBPage extends State<ThirdBPage> {

  final Map<String, String> imageMap = Building.thirdB;
  String? numberFloor;
  final String? jsonFile = Building.jsonFiles['3б'];

  @override
  void initState () {
    super.initState();
    numberFloor = widget.numberFloor ?? imageMap.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text('Корпус 3бв'),
        centerTitle: true,
        ),

      body: SingleChildScrollView (
        child: Column(
          children: [
            const SizedBox(height: 60.0),
            Center (
              child: Container (
                height: 30,
                width: 50,
                // color: const Color.fromARGB(255, 200, 155, 250),
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
