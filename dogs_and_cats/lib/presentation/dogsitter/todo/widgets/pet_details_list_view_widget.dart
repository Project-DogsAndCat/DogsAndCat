import 'package:dogs_and_cats/presentation/dogsitter/todo/widgets/rich_text_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../domain/models/task.dart';
import '../../../order/widgets/container_widget.dart';

class PetDetailsListViewWidget extends StatelessWidget {
  const PetDetailsListViewWidget({super.key, required this.task});
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
            RichTextWidget(
                title: AppString.nameOfPet, value: task.pet[index].name),
            RichTextWidget(
                title: AppString.breed, value: task.pet[index].breed),
            RichTextWidget(
                title: AppString.gender, value: task.pet[index].gender),
            RichTextWidget(
                title: AppString.age,
                value: task.pet[index].dateBhD.toString()),
            RichTextWidget(
                title: AppString.weight,
                value: task.pet[index].weight.toString()),
            RichTextWidget(
              title: AppString.propertiesPet,
              value: task.pet[index].selectedCategory.isEmpty
                  ? 'Без особенностей'
                  : task.pet[index].selectedCategory,
            ),
            RichTextWidget(
              title: AppString.otherFeatures,
              value: task.pet[index].otherFeatures.isEmpty
                  ? 'Без дополнительных особенностей'
                  : task.pet[index].otherFeatures,
            ),
            const SizedBox(
              height: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}
