import 'package:flutter/material.dart';

import 'ImageBuilder.dart';

const Map<String, String> imageMap = {
  '1': 'Без_имени',
  '2': 'пригодится',
  '3': '3-3б',
  '4': 'пригодится',
  '5': 'пригодится',
  '6': 'пригодится',
  '7': 'пригодится',
  '8': 'пригодится',
  '9': 'пригодится',
  '10': 'пригодится',
};

class ThirdBPage extends StatefulWidget {
  const ThirdBPage({super.key, this.selectedImage});

  final String? selectedImage;

  @override
  State<ThirdBPage> createState() => _ThirdBPage();
}

class _ThirdBPage extends State<ThirdBPage> {

  String? selectedImage;

  @override
  void initState () {
    super.initState();
    selectedImage = widget.selectedImage ?? imageMap.keys.first;
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
                  value: selectedImage,
                  icon: const Icon(Icons.keyboard_arrow_right_outlined),
                  elevation: 18,
                  isExpanded: true,
                  iconSize: 24,
                  style: const TextStyle(color: Colors.black ,fontSize: 20.0),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedImage = newValue!;
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
            ImageBuilder(selectedImage: selectedImage, imageMap: imageMap),
            const SizedBox(height: 40.0),
          ]
        ),
      ),
    );
  }
}
