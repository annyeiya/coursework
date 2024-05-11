import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  _Loading createState() => _Loading();
}
class _Loading extends State<Loading> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/anim.mp4')
      ..initialize().then((_) {
        setState(() {
          controller.play();
        });
      });
    controller.addListener(() {
      if (controller.value.position >= controller.value.duration) {
        Navigator.of(context).pushReplacementNamed('/start');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            )
        )
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}