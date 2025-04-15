import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
      value: "Зооняня",
      child: const Text("Зооняня"),
    ),
    DropdownMenuItem(
      value: "Кинолог",
      child: const Text("Кинолог"),
    ),
    DropdownMenuItem(
      value: "Выгульщик",
      child: const Text("Выгульщик"),
    ),
  ];
  return menuItems;
}
