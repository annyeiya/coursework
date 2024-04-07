import 'package:flutter/material.dart';

import 'package:untitled/widgets/Classroom.dart';

class ThirdThirdB extends StatelessWidget {
  const ThirdThirdB({super.key, required this.selectedImage});

  final String? selectedImage;

  @override
  Widget build(BuildContext context) {

    return OrientationBuilder (
      builder: (BuildContext context, Orientation orientation) {
       return Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
                'assets/img/$selectedImage.jpg',
                key: UniqueKey(),
                fit: BoxFit.fitWidth,
            ),
          ),

          ///здесь настраиваются кнопки для аудиторий

          Classroom.classroom(context, '323', 0.36, 0.08, 0.06, 0.07),

          Classroom.classroom(context, '330', 0.25, 0.18, 0.12, 0.07),

        ]);
    });
  }


}