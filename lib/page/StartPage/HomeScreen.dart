import 'package:flutter/cupertino.dart';

import 'ImageBuilder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Column (
          children: [
            const SizedBox(height: 40.0),
            const Text(
              'Добро пожаловать',
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            ImageBuilder(),
          ]
      ),
    );
  }
}