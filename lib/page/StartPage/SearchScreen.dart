import 'package:flutter/material.dart';

import '../ThirdB/ThirdBPage.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreen();
}

List<String> buildList = ['3бв'];

class _SearchScreen extends State<SearchScreen> {

  final TextEditingController _classroom = TextEditingController();
  final TextEditingController _buildnumber = TextEditingController();

  String warning = '';

  @override
  void dispose() {
    _classroom.dispose();
    _buildnumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _classroom,
                decoration: const InputDecoration(labelText: '№ аудитории',),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextField(
                controller: _buildnumber,
                decoration: const InputDecoration(labelText: 'Корпус',),
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            String buildNumb = _buildnumber.text.toLowerCase();
            int? classroom = int.tryParse(_classroom.text);
            if (classroom == null) {
              setState(() {
                warning = 'Неверный ввод аудитории';
              });
            } else if (classroom < 100 || classroom > 1300) { /// сомнительные ограничения но окей
              setState(() {
                warning = 'Такой аудитории не существует';
              });
            } else if (!buildList.contains(buildNumb)) {
              setState(() {
                warning ='Такого корпуса не существует';
              });
            } else {
              setState(() {
                warning ='';
              });
              searcher(context, classroom, buildNumb);
            }
          },
          child: const Text('Найти'),
        ),
        Row(
          children: [
            Text(
              warning,
              style: const TextStyle(fontSize: 15, color: Colors.red),
            ),
          ],
        )
      ],
    );
  }
}

void searcher(BuildContext context,int classroom, String buildNumb) {
  String room = setNumbClass(classroom);
  switch (buildNumb) {
    case '3бв':
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ThirdBPage(selectedImage: room)),
      );
      break;
  }
}

String setNumbClass(int classroom) {
  String room = classroom.toString();
  if (room.length == 3) {
    return room[0];
  } else if (room.length == 4) {
    return room[0] + room[1];
  }
  return '';
}