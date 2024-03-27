import 'package:flutter/material.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    const String selectedImage = 'assets/img/вся_карта.jpg';
    return Row (
        children: [
          Expanded(
            child: InteractiveViewer(
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
                        left: 55,
                        top: 300,
                        child: GestureDetector (
                          onTap: () {
                            Navigator.of(context).pushNamed('/third_b');
                          },
                          child: Container (
                            width: 30,
                            height: 80,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      Positioned( /// 3а
                        left: 85,
                        top: 300,
                        child: GestureDetector (
                          onTap: () {
                            Navigator.of(context).pushNamed('/third_a');
                          },
                          child: Container (
                            width: 70,
                            height: 30,
                            color: Colors.transparent, //transparent
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ]);
  }
}