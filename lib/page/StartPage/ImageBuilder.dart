import 'package:flutter/material.dart';
import 'package:untitled/widgets/Building.dart';

import '../../widgets/Classroom.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({super.key});
  final String selectedImage = Building.start;

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context);


    return OrientationBuilder (
      builder: (context, orientation) {
        return InteractiveViewer(
          minScale: 1.0,
          maxScale: 5.0,
          child: Stack (
              children: [
                SizedBox(
                  width: theme.size.width,
                  child: Image.asset(
                    selectedImage,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Classroom.building(context, '/third_b', 0.1, 0.54, 0.07, 0.2),

                //building(context, '/third_a', 85, 300, 70, 30, 45, 145, 60, 20)

              ]),

        );
     });
  }

}