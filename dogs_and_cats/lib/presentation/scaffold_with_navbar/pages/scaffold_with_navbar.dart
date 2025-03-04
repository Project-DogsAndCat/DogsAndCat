import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  const ScaffoldWithNavbar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.blueAccent,
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => _onItemTapped(context, index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit_outlined), label: 'Погулять'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), label: 'Услуги'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: 'Аккаунт'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Настройки'),
          ]),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }
}
