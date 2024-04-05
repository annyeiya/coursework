import 'package:flutter/material.dart';

import '../../widgets/Building.dart';
import 'ImageBuilder.dart';


class ThirdBPage extends StatefulWidget {
  ThirdBPage({super.key, this.selectedImage});

  final Map<String, String> imageMap = Building.thirdB;
  final String? selectedImage;

  @override
  State<ThirdBPage> createState() => _ThirdBPage();
}

class _ThirdBPage extends State<ThirdBPage> {

  late final Map<String, String> imageMap;
  String? selectedImage;

  @override
  void initState () {
    super.initState();
    imageMap = widget.imageMap;
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
                  underline: Container(height: 0,),
                  isExpanded: true,
                  iconSize: 24,
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
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
