import 'package:flutter/material.dart';

const Map<String, String> imageMap = {
  '1': 'три_а',
  '2': 'пригодится',
  '3': 'пригодится',
  '4': 'пригодится',
  '5': 'пригодится',
  '6': 'пригодится',
};

class ThirdAPage extends StatefulWidget {
  const ThirdAPage({super.key});
  @override
  State<ThirdAPage> createState() => _ThirdAPage();
}

class _ThirdAPage extends State<ThirdAPage> {

  String? selectedImage = imageMap.keys.first;

  void  _testMethod() {
    print("hi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text('Карта ЮУрГУ'),
        centerTitle: true,
        ),

      body: //SingleChildScrollView (
      //  child: Column(
      //   children: [
      //     const SizedBox(height: 40.0),
      //     const Text(
      //       'Вы находитесь в корпусе 3а',
      //       style: TextStyle(fontSize: 24.0),
      //       textAlign: TextAlign.center,
      //     ),
      //     const SizedBox(height: 40.0),
          Center (
          child: Row (
            children: [
              Expanded(
                flex: 7,
                child: InteractiveViewer(
                  minScale: 1.0,
                  maxScale: 5.0,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 5 / 8,
                      child: Image.asset(
                        'assets/img/${imageMap[selectedImage]}.jpg',
                        key: UniqueKey(),
                        fit: BoxFit.contain,
                      )
                  ),
                ),
              ),
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
    //     ]
    //   ),
    // ),
          ));
  }
}
