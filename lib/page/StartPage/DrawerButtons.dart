import 'package:flutter/material.dart';

import '../OverPage/CorpusPage.dart';

class DrawerButtons extends StatelessWidget {
  const DrawerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer (
        child: ListView (
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(255, 200, 155, 250)),
                child: Text (
                  'Выберите корпус',
                  style: TextStyle(fontSize: 24, ),
                ),
              ),
            ),
            ListTile(
              title: const Text('корпус 3бв'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CorpusPage(name: '3б')),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('корпус 3а'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CorpusPage(name: '3а')),
                );
              },
            ),
            const Divider(),

            //TODO остальные корпуса
          ],
        )
    );
  }
}