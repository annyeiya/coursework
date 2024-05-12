import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import 'ImageBuilder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
      child: Column (
          children: [
            const SizedBox(height: 40.0),
            const LocaleText(
              'welcome',
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