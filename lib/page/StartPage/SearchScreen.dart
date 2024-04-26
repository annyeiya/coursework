import 'package:flutter/material.dart';

import '../OverPage/CorpusPage.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreen();
}

List<String> buildList = ['3б', '3а'];

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
            const SizedBox(width: 30),
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
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 20),
        TextButton (
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
        Row (
          mainAxisAlignment: MainAxisAlignment.center,
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
    case '3б':
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CorpusPage(numberFloor: room, name: '3б')),
      );
      break;
    case '3а':
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CorpusPage(numberFloor: room, name: '3а')),
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