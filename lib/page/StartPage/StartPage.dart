import 'package:flutter/material.dart';

import 'Bottons.dart';
import 'ImageBuilder.dart';

void  _testMethod() {
  print("hi");
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});
  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Center (
            child: Text('Карта ЮУрГУ')
        ),
      ),
      body: const SingleChildScrollView (
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                    'Добро пожаловать',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 40.0),
                  ImageBuilder(),
                  SizedBox(height: 50.0),
                  Buttons(),
                ]
            ),
          )
      ),
    );
  }
}
