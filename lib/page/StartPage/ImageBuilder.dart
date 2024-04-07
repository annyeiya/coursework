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
          child: Stack (
              children: [
                SizedBox(
                  width: theme.size.width,
                  child: Image.asset(
                    selectedImage,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                building(context, '/third_b', 0.1, 0.54, 0.07, 0.2, 0.1, 0.54, 0.07, 0.2),

                //building(context, '/third_a', 85, 300, 70, 30, 45, 145, 60, 20)

              ]),

        );
     });
  }

  Widget building (BuildContext context, String number,
  double vLeft, double vTop, double vWeidth, double vHeight,
  double gLeft, double gTop, double gWeidth, double gHeight,
  {Color color = Colors.amber}) {

    final theme = MediaQuery.of(context);
    final nav = Navigator.of(context);

    return Positioned(
      left: theme.orientation == Orientation.portrait ? theme.size.shortestSide * vLeft : theme.size.longestSide * gLeft,
      top: theme.orientation == Orientation.portrait ? theme.size.shortestSide * vTop : theme.size.longestSide * gTop,
      child: GestureDetector(
        onTap: () => nav.pushNamed(number),
        child: Container(
          width: theme.orientation == Orientation.portrait ? theme.size.shortestSide * vWeidth : theme.size.longestSide * gWeidth,
          height: theme.orientation == Orientation.portrait ? theme.size.shortestSide * vHeight : theme.size.longestSide * gHeight,

          color: color,
        ),
      ),
    );
  }
}