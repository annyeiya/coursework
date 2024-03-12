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

const Map<String, String> imageMap = {
  '1': 'пригодится',
  '2': 'монограмма3',
  '3': 'третье'
};

class StartPage extends StatefulWidget {
  const StartPage({super.key});
  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {

  String? selectedImage = imageMap.keys.first;

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


// class StatfulImage extends StatefulWidget {
//   const StatfulImage({super.key});
//   @override
//   State<StatfulImage> createState() => _StatfulImage();
// }
// class _StatfulImage extends State<StatfulImage> {
//   String? selectedImage = list.first;
//
//   @override
//   Widget build(BuildContext context) {
//   return Scaffold(
//     body: Row (
//       children: [
//         Expanded(
//           flex: 7,
//           child: InteractiveViewer(
//               minScale: 1.0,
//               maxScale: 5.0,
//               child: Image.asset(
//                 'assets/img/пригодится.jpg',
//                 fit: BoxFit.contain,
//               )
//           ),
//         ),
//         Expanded (
//             flex: 1,
//             child: DropdownButton<String>(
//               value:selectedImage,
//               icon: const Icon(Icons.arrow_downward),
//               elevation: 16,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedImage = newValue!;
//                 });
//               },
//               items: list.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             )
//         )
//       ],
//     ));
//   }
// }
//
