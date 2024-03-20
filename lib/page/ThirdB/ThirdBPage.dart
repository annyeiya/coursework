import 'package:flutter/material.dart';
import 'Bottons.dart';
import 'ImageBuilder.dart';

void  _testMethod() {
  print("hi");
}

const Map<String, String> imageMap = {
  '1': 'Без_имени',
  '2': 'пригодится',
  '3': 'пригодится',
  '4': 'пригодится',
  '5': 'пригодится',
  '6': 'пригодится',
  '7': 'пригодится',
  '8': 'пригодится',
  '9': 'пригодится',
  '10': 'пригодится',
  '11': 'пригодится',
  '12': 'пригодится',
};

class ThirdBPage extends StatefulWidget {
  const ThirdBPage({super.key});
  @override
  State<ThirdBPage> createState() => _ThirdBPage();
}

class _ThirdBPage extends State<ThirdBPage> {

  String? selectedImage = imageMap.keys.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Center (
            child: Text('Карта ЮУрГУ')
        ),
      ),
      body: SingleChildScrollView (
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 40.0),
                  const Text(
                    'Вы находитесь в корпусе 3бв',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 40.0),
                  Row (
                    children: [
                      ImageBuilder(selectedImage: selectedImage, imageMap: imageMap),
                      Expanded (
                          flex: 1,
                          child: DropdownButton<String>(
                            value:selectedImage,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
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
                          )
                      )
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  Buttons(),
                ]
            ),
          )
      ),
    );
  }
}
