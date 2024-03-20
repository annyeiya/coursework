import 'package:flutter/material.dart';


class ImageBuilder extends StatelessWidget {
  const ImageBuilder({super.key, required this.selectedImage, required this.imageMap});

  final String? selectedImage;
  final Map<String, String> imageMap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}