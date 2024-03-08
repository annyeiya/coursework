import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // primarySwatch: Colors.amber,
        ),
        routes: {
          '/': (context) => const StartPage(),
        }
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  void  _testMethod() {
    print("hi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
          title: const Center (
              child: Text('Susu Map')
          ),
          backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView (
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 40.0),
                  const Text(
                    'Hello',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 40.0),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Expanded(
                        flex: 7,
                        child: InteractiveViewer(
                          minScale: 1.0,
                          maxScale: 5.0,
                          child: Image.asset(
                            'assets/img/пригодится.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () {
                              _testMethod();
                            },
                            child: Text('fsdf')
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _testMethod();
                          },
                          child: Text('botton 1'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _testMethod();
                          },
                          child: Text('botton 2')
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _testMethod();
                          },
                          child: Text('botton 3')
                      ),
                    ],
                  )
                ]
            ),
          )
      ),
    );
  }
}


