import 'package:dogs_and_cats/presentation/account/widgets/profile_list_card.dart';
import 'package:flutter/material.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton(
      {super.key,
      required this.onPressed,
      required this.mainInfoTitle,
      required this.otherInfoTitle,
      required this.icon});
  final VoidCallback onPressed;
  final String mainInfoTitle;
  final String otherInfoTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: ProfileListCard(
          mainInfoTitle: mainInfoTitle,
          otherInfoTitle: otherInfoTitle,
          icon: icon),
    );
  }
}
