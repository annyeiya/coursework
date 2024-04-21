import 'package:flutter/material.dart';
import 'package:untitled/page/StartPage/StartPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 200, 155, 250),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.w500,
            )
          ),
        ),
        routes: {
          '/': (context) => const StartPage(),
          // '/third_b': (context) => const ThirdBPage(name: '3б',),
          // '/third_a': (context) => const ThirdAPage(),
          // '/mab': (context) => const MABPage(),
        }
    );
  }
}

