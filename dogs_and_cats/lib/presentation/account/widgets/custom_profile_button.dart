import 'package:flutter/material.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton(
      {super.key,
      required this.onPressed,
      required this.mainInfoTitle,
      this.otherInfoTitle,
      required this.icon});
  final VoidCallback onPressed;
  final String mainInfoTitle;
  final String? otherInfoTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainInfoTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                otherInfoTitle != null
                    ? Text(
                        otherInfoTitle!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    : Container()
              ],
            ),
            Icon(
              icon,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
