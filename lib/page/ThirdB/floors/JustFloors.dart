import 'package:flutter/material.dart';

class JustFloors extends StatelessWidget {
  const JustFloors({super.key, required this.selectedImage});

  final String? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 5 / 8,
            child: Image.asset(
              'assets/img/$selectedImage.jpg',
              key: UniqueKey(),
              fit: BoxFit.contain,
            ),
          ),
        ]);
  }
}