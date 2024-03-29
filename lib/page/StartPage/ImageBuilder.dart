import 'package:flutter/material.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({super.key});
  final String selectedImage = 'assets/img/вся_карта.jpg';

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder (
      builder: (context, orientation) {
        return InteractiveViewer(
          minScale: 1.0,
          maxScale: 5.0,
          child: Center (
             child: Stack (
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 5 / 8,
                    child: Image.asset(
                      selectedImage,
                      key: UniqueKey(),
                      fit: BoxFit.contain,
                    )
                ),
                Positioned( /// 3бв
                  left: MediaQuery.of(context).orientation == Orientation.portrait ? 55 : 35,
                  top: MediaQuery.of(context).orientation == Orientation.portrait ? 300 : 145,
                  child: GestureDetector (
                    onTap: () {
                      Navigator.of(context).pushNamed('/third_b');
                    },
                    child: Container (
                      width: MediaQuery.of(context).orientation == Orientation.portrait ? 30 : 15,
                      height: MediaQuery.of(context).orientation == Orientation.portrait ? 80 : 55,
                      color: Colors.amber,
                    ),
                  ),
                ),
                Positioned( /// 3а
                  left: MediaQuery.of(context).orientation == Orientation.portrait ? 85 : 45,
                  top: MediaQuery.of(context).orientation == Orientation.portrait ? 300 : 145,
                  child: GestureDetector (
                    onTap: () {
                      Navigator.of(context).pushNamed('/third_a');
                    },
                    child: Container (
                      width: MediaQuery.of(context).orientation == Orientation.portrait ? 70 : 60,
                      height: MediaQuery.of(context).orientation == Orientation.portrait ? 30 : 20,
                      color: Colors.transparent, //transparent
                    ),
                  ),
                ),
              ]),
          ),
        );
     });
  }
}