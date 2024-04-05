import 'package:flutter/material.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({super.key});
  final String selectedImage = 'assets/img/вся_карта.jpg';

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context);


    return OrientationBuilder (
      builder: (context, orientation) {
        return InteractiveViewer(
          minScale: 1.0,
          maxScale: 5.0,
          child: Center (
             child: Stack (
              children: [
                SizedBox(
                    height: theme.size.height * 5 / 8,
                    child: Image.asset(
                      selectedImage,
                      fit: BoxFit.contain,
                    )
                ),
                building(context, '/third_b', 55, 300, 30, 80, 35, 145, 15, 55),

                building(context, '/third_a', 85, 300, 70, 30, 45, 145, 60, 20)

              ]),
          ),
        );
     });
  }

  Widget building (BuildContext context, String number,
  double vLeft, double vTop, double vWeidth, double vHeight,
  double gLeft, double gTop, double gWeidth, double gHeight,
  {Color color = Colors.transparent}) {

    final theme = MediaQuery.of(context);
    final nav = Navigator.of(context);

    return Positioned(
      left: theme.orientation == Orientation.portrait ? vLeft : gLeft,
      top: theme.orientation == Orientation.portrait ? vTop : gTop,
      child: GestureDetector (
        onTap: () => nav.pushNamed(number),
        child: Container (
          width: theme.orientation == Orientation.portrait ? vWeidth : gWeidth,
          height: theme.orientation == Orientation.portrait ? vHeight : gHeight,
          color: color,
        ),
      ),
    );
  }
}