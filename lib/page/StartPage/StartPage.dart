import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import 'DrawerButtons.dart';
import 'HomeScreen.dart';
import 'SearchScreen.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});
  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: NestedScrollView (
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            title: LocaleText('susumap'),
            centerTitle: true,
            floating: false,
            pinned: false,
            snap: false,
          ),
        ],

        body: [
          const HomeScreen(),
          const SearchScreen(),
        ][_currentPageIndex],),

      drawer: const DrawerButtons(),

      bottomNavigationBar: NavigationBar (
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        height: 60,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: const Color.fromARGB(255, 200, 155, 250),
        selectedIndex: _currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: const Icon(Icons.home),
            icon: const Icon(Icons.home_outlined),
            label: context.localeString('map'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.search),
            label: context.localeString('search'),
          ),
        ],
      )
    );
  }
}
