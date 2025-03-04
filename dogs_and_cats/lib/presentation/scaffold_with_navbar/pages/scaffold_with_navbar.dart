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
          ]),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }
}

/*
import 'package:auto_route/auto_route.dart';
import 'package:dogs_and_cats/core/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        SearchRoute(),
        DogsitterRoute(),
        AccountRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.blueAccent,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => _onItemTapped(index, tabsRouter),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.ac_unit_outlined), label: 'Погулять'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.access_alarm), label: 'Услуги'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_rounded), label: 'Аккаунт'),
              ]),
        );
      },
    );
  }

  void _onItemTapped(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
*/
