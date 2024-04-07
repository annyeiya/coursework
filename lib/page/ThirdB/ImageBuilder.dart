import 'package:flutter/material.dart';

import 'floors/JustFloors.dart';
import 'floors/ThirdThirdB.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({super.key, required this.selectedImage, required this.imageMap});

  final String? selectedImage;
  final Map<String, String> imageMap;


  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 1.0,
      maxScale: 5.0,
      child: Builder(builder: (BuildContext context) {
          switch (selectedImage) {
            case "3":
              return ThirdThirdB(selectedImage: imageMap[selectedImage]);
            default:
              return JustFloors(selectedImage: imageMap[selectedImage]);
              //TODO default is only for this work, must be default:Center(); do all case
          }
        }),
    );
  }
}