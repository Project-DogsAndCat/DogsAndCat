import 'package:dogs_and_cats/presentation/account/widgets/profile_list_card.dart';
import 'package:flutter/material.dart';

class CustomServiceButton extends StatelessWidget {
  const CustomServiceButton(
      {super.key,
      required this.onPressed,
      required this.nameService,
      required this.description});
  final VoidCallback onPressed;
  final String nameService;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(),
              Column(
                children: [
                  Text(nameService),
                  Text(description),
                ],
              )
            ],
          ),
        ));
  }
}
