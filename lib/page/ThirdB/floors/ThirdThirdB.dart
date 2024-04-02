import 'package:flutter/material.dart';

import 'package:untitled/widgets/Classroom.dart';

class ThirdThirdB extends StatelessWidget {
  const ThirdThirdB({super.key, required this.selectedImage});

  final String? selectedImage;

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context);

    return OrientationBuilder (
      builder: (BuildContext context, Orientation orientation) {
       return Stack(
        children: [
          SizedBox(
            height: theme.size.height * 5 / 8,
            child: Image.asset(
              'assets/img/$selectedImage.jpg',
              key: UniqueKey(),
              fit: BoxFit.contain,
            ),
          ),

          ///здесь настраиваются кнопки для аудиторий

          Classroom.classroom(context, '323', 165, 185, 22, 80, 195, 30, 25, 90),

          Classroom.classroom(context, '330', 115, 290, 50, 75, 135, 155, 60, 90, color: Colors.amber),

        ]);
    });
  }


}