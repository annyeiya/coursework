import 'package:flutter/material.dart';
import 'package:untitled/widgets/Building.dart';

import 'Buttons.dart';

class ImageBuilder extends StatelessWidget {
  ImageBuilder({super.key});
  final String _selectedImage = Building.start;
  final String? _jsonFile = Building.jsonFiles['start'];

  Future<List<Widget>> _getButtons(BuildContext context) async {
    List<Buttons> building = await Buttons.getButtonsFromJson(context, _jsonFile!);
    List<Widget> buttonsWidgets = building.map((building) =>
        Buttons.building(context, building)).toList();
    return buttonsWidgets;
  }

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context);

    return InteractiveViewer(
      minScale: 1.0,
      maxScale: 5.0,
      child: FutureBuilder<List<Widget>>(
        future: _getButtons(context),
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
                          width: theme.size.width,
                          child: Image.asset(
                            _selectedImage,
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
        }),
    );
  }
}