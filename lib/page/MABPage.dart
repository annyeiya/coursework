import 'package:flutter/material.dart';

const Map<String, String> imageMap = {
  '1': 'гук1',
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

class MABPage extends StatefulWidget {
  const MABPage({super.key});
  @override
  State<MABPage> createState() => _MABPage();
}

class _MABPage extends State<MABPage> {

  String? selectedImage = imageMap.keys.first;

  void  _testMethod() {
    print("hi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Center (
            child: Text('Карта ЮУрГУ')
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 40.0),
          const Text(
            'Вы находитесь в главном корпусе',
            style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40.0),
          Row (
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
       ]
  ),
);
  }
}
