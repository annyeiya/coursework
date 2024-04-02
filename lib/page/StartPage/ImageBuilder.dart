import 'package:flutter/material.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({super.key});
  final String selectedImage = 'assets/img/вся_карта.jpg';

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context);
    final nav = Navigator.of(context);

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
                Positioned( /// 3бв
                  left: theme.orientation == Orientation.portrait ? 55 : 35,
                  top: theme.orientation == Orientation.portrait ? 300 : 145,
                  child: GestureDetector (
                    onTap: () => nav.pushNamed('/third_b'),
                    child: Container (
                      width: theme.orientation == Orientation.portrait ? 30 : 15,
                      height: theme.orientation == Orientation.portrait ? 80 : 55,
                      color: Colors.amber,
                    ),
                  ),
                ),
                Positioned( /// 3а
                  left: theme.orientation == Orientation.portrait ? 85 : 45,
                  top: theme.orientation == Orientation.portrait ? 300 : 145,
                  child: GestureDetector (
                    onTap: () => nav.pushNamed('/third_a'),
                    child: Container (
                      width: theme.orientation == Orientation.portrait ? 70 : 60,
                      height: theme.orientation == Orientation.portrait ? 30 : 20,
                      color: Colors.transparent, //c
                    ),
                  ),
                ),
              ]),
          ),
        );
     });
  }
}