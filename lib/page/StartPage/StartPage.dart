import 'package:flutter/material.dart';

import 'DrawerButtons.dart';
import 'ImageBuilder.dart';
import 'SearchScreen.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});
  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Center (
            child: Text('Карта ЮУрГУ')
        ),
      ),

      body: [
        const HomeScreen(),
        const SearchScreen(),
      ][currentPageIndex],

      drawer: const DrawerButtons(),

      bottomNavigationBar: NavigationBar (
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        height: 60,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: const Color.fromARGB(255, 200, 155, 250),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'search',
          ),
        ],
      )
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        SizedBox(height: 40.0),
        Text(
          'Добро пожаловать',
          style: TextStyle(fontSize: 24.0),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40.0),
        ImageBuilder(),
      ]
    );
  }
}
