import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import 'container_widget.dart';

class PetNameListViewWidget extends StatelessWidget {
  const PetNameListViewWidget({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: task.pet.length,
      separatorBuilder: (_, __) => const SizedBox(height: 5),
      itemBuilder: (_, index) => ContainerWidget(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.pet[index].name,
              style: textTheme.labelMedium,
            ),
            const SizedBox(
              height: 3.0,
            ),
            Text(
              task.pet[index].selectedCategory.isEmpty
                  ? 'Без особенностей'
                  : task.pet[index].selectedCategory,
              style: textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
