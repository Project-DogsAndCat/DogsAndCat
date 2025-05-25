import 'package:flutter/material.dart';

class IconLocationMap extends StatelessWidget {
  const IconLocationMap({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withAlpha(60),
              blurRadius: 6.0,
              spreadRadius: 0.0,
              offset: const Offset(
                0.0,
                3.0,
              ),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(
          icon,
          color: Colors.black,
          size: 35.0,
        ),
      ),
    );
  }
}
