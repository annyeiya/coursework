import 'package:flutter/material.dart';
import 'package:untitled/Loading.dart';
import 'package:untitled/page/StartPage/StartPage.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
          '/': (context) => const Loading(),
          '/start': (context) => const StartPage(),
        }
    );
  }
}

