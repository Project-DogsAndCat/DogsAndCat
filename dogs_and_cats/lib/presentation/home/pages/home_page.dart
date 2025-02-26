import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _selectedPageIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.blueAccent,
            currentIndex: _selectedPageIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.ac_unit_outlined), label: 'Погулять'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm), label: 'Услуги'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded), label: 'Аккаунт'),
            ]),
        body: PageView(
          controller: _pageController,
          children: [
            SearchScreen(),
            Scaffold(),
            Scaffold(),
          ],
        )
    );
  }

  void _onItemTapped(int index) {
    setState(() => _selectedPageIndex = index);
    _pageController.jumpToPage(index);
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Hi');
  }
}
