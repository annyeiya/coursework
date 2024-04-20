import 'package:flutter/material.dart';

import 'package:untitled/widgets/Classroom.dart';

class ImageBuilder extends StatelessWidget {
  const ImageBuilder({super.key, required this.numberFloor, required this.imageMap, this.jsonFile});

  final String? numberFloor;
  final Map<String, String> imageMap;
  final String? jsonFile;

  Future<List<Widget>> getClassroom (BuildContext context) async {
    List<Classroom> classrooms = await Classroom.getClassroomsFromJson(context, jsonFile!, numberFloor!);
    List<Widget> classroomWidgets = classrooms.map((classroom) =>
        Classroom.classroom(context, classroom)).toList();
    return classroomWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 1.0,
      maxScale: 5.0,
      child: FutureBuilder<List<Widget>>(
        future: getClassroom(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
                  return Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/img/${imageMap[numberFloor]}.jpg',
                          key: UniqueKey(),
                          fit: BoxFit.fitWidth,
                        ),
                      ),

                      ...snapshot.data!,

                    ]);
                });
            }
          } else {
            return const CircularProgressIndicator();
          }
        })
    );
  }
}