import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});
  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {

  final String selectedImage = 'assets/img/Студ_городок.jpg';

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
      body: SingleChildScrollView (
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  const Text(
                    'Добро пожаловать',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 40.0),
                  Row(
                    children: [
                      Expanded(
                        child: InteractiveViewer(
                          minScale: 1.0,
                          maxScale: 5.0,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 5 / 8,
                            child: Image.asset(
                              selectedImage,
                              key: UniqueKey(),
                              fit: BoxFit.contain,
                            )
                          ),
                        ),
                      ),
                  ]),
                  const SizedBox(height: 50.0),
                  Column(
                    children: [
                      Row (
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/mab');
                            },
                            child: Text('ГУК'),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                _testMethod();
                              },
                              child: Text('корпус 2')
                          ),
                          ElevatedButton(
                              onPressed: () {
                                _testMethod();
                              },
                              child: Text('ЛК')
                          ),
                        ],
                      ),
                      Row (
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/third_a');
                              },
                              child: Text('корпус 3а')
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/third_b');
                              },
                              child: Text('корпус 3бв')
                          ),
                        ],
                      )
                    ],
                  )
                ]
            ),
          )
      ),
    );
  }
}
