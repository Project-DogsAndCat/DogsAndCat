import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/rounded_elevated_button.dart';

class ListTileTask extends StatelessWidget {
  const ListTileTask({
    super.key,
    this.buttonText,
    this.onPressed,
    required this.task,
    required this.dogsitter,
  });
  final TaskModel task;
  final String? buttonText;
  final Dogsitter dogsitter;
  final Function(
    BuildContext context,
    TaskModel task,
    Dogsitter dogsitter,
  )? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(task.serviceTitle),
          Text(task.order.id!),
          Text(task.order.price.toString()),
          Text(task.order.date.toString()),
          Text(task.order.status.value),
          buttonText != null
              ? RoundedElevatedButton(
                  onPressed: () {
                    onPressed!(context, task, dogsitter);
                  },
                  widget: Text(buttonText!),
                )
              : Container(),
        ],
      ),
      subtitle: Text(task.person.firstName!),
    );
  }
}
