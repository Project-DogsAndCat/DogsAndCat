import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.onTap,
    required this.controller,
  });

  final VoidCallback onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.search_rounded),
            const SizedBox(width: 12),
            AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return Text(
                  controller.text.isEmpty ? 'Поиск породы' : controller.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
