import 'package:dogs_and_cats/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';

class DogsitterScaffoldWithNavbar extends StatefulWidget {
  const DogsitterScaffoldWithNavbar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<DogsitterScaffoldWithNavbar> createState() =>
      _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends State<DogsitterScaffoldWithNavbar> {
  List<String> listOfStrings = [
    'Заказы',
    'Аккаунт',
    'Настройки',
  ];

  List<IconData> listOfIcons = [
    Icons.task,
    Icons.person_rounded,
    Icons.settings_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Container(
              height: 64,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.backGroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.backGroundColor.withOpacity(0.3),
                    offset: Offset(0, 20),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: listOfStrings.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => _onItemTapped(context, index),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == widget.navigationShell.currentIndex
                            ? displayWidth * .32
                            : displayWidth * .27,
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: index == widget.navigationShell.currentIndex
                              ? displayWidth * .12
                              : 0,
                          width: index == widget.navigationShell.currentIndex
                              ? displayWidth * .30
                              : 0,
                          decoration: BoxDecoration(
                            color: index == widget.navigationShell.currentIndex
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == widget.navigationShell.currentIndex
                            ? displayWidth * .31
                            : displayWidth * .18,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index ==
                                          widget.navigationShell.currentIndex
                                      ? displayWidth * .12
                                      : 0,
                                ),
                                AnimatedOpacity(
                                  opacity: index ==
                                          widget.navigationShell.currentIndex
                                      ? 1
                                      : 0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: Text(
                                    index == widget.navigationShell.currentIndex
                                        ? listOfStrings[index]
                                        : '',
                                    style: textTheme.titleSmall,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index ==
                                          widget.navigationShell.currentIndex
                                      ? displayWidth * .03
                                      : 40,
                                ),
                                Icon(
                                  listOfIcons[index],
                                  size: displayWidth * .056,
                                  color: index ==
                                          widget.navigationShell.currentIndex
                                      ? AppColors.backGroundColor
                                      : AppColors.bottomNavigationBarIconColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }
}
