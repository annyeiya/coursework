import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

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
                child: LocaleText(
                  'selecthousing',
                  style: TextStyle(fontSize: 24, ),
                ),
              ),
            ),
            ListTile(
              title: Text("${context.localeString("housing")} 3бв"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CorpusPage(name: '3б')),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: Text("${context.localeString("housing")} 3а"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CorpusPage(name: '3а')),
                );
              },
            ),
            const Divider(),

            //TODO остальные корпуса

            IconButton(
              icon: const Icon(Icons.translate),
              onPressed: () {
                if (context.currentLocale?.languageCode == 'en') {
                  context.changeLocale('ru');
                } else {
                  context.changeLocale('en');
                }
              }
            )
          ],
        )
    );
  }
}