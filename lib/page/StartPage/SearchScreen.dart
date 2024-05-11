import 'package:flutter/material.dart';

import '../OverPage/CorpusPage.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {

  final List<String> _buildList = ['3б', '3бв', '3а'];

  final TextEditingController _classroom = TextEditingController();
  final TextEditingController _buildnumber = TextEditingController();

  String _warning = '';

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
            String buildNumb = _buildnumber.text.trim().toLowerCase();
            String classroom = _classroom.text.trim();
            bool isClassroom = RegExp(r'^\d+[аб]?$').hasMatch(classroom);
            int clas = isClassroom ? int.parse(classroom.replaceAll(RegExp(r'[аб]$'), '')) : 0;
            if (!isClassroom) {
              setState(() {
                _warning = 'Неверный ввод аудитории';
              });
            } else if (clas < 100 || clas > 1100) { /// сомнительные ограничения но окей
              setState(() {
                _warning = 'Такой аудитории не существует';
              });
            } else if (!_buildList.contains(buildNumb)) {
              setState(() {
                _warning ='Такого корпуса не существует';
              });
            } else {
              setState(() {
                _warning ='';
              });
              _searcher(context, clas, buildNumb);
            }
          },
          child: const Text('Найти'),
        ),
        Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_warning == '' ? null : Icons.error_outline, color: Colors.red,),
            Text(
              _warning,
              style: const TextStyle(fontSize: 15, color: Colors.red),
            ),
          ],
        )
      ],
    );
  }
}

void _searcher(BuildContext context, int classroom, String buildNumb) {
  String room = _setNumbClass(classroom);
  switch (buildNumb) {
    case ('3б' || '3бв'):
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

String _setNumbClass(int classroom) {
  String room = classroom.toString();
  if (room.length == 3) {
    return room[0];
  } else if (room.length == 4) {
    return room[0] + room[1];
  }
  return '';
}