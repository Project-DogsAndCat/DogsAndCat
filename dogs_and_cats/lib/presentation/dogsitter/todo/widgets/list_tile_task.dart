import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/routes/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/rounded_elevated_button.dart';
import '../../../order/widgets/container_widget.dart';
import '../../../order/widgets/order_status_widget.dart';

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
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: ContainerWidget(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderStatusWidget(status: task.order.status.value),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  '${DateFormat.MMMMEEEEd('RU-ru').format(task.order.date)}, ${DateFormat.Hm('RU-ru').format(task.order.date)}',
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  task.serviceTitle,
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Text(
                      AppString.serviceFor,
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 5,
                          children: [
                            for (var i = 0; i < task.pet.length; i++)
                              Text(i != task.pet.length - 1
                                  ? '${task.pet[i].name},'
                                  : task.pet[i].name)
                          ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  '${task.order.price.toStringAsFixed(0)} руб',
                  style: textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                GestureDetector(
                  child: Text(
                    AppString.orderDetails,
                    style: textTheme.bodyLarge!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  onTap: () {
                    context.replaceNamed(RoutesNames.taskDetails, extra: task);
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                buttonText != null
                    ? RoundedElevatedButton(
                        color: AppColors.backGroundColor,
                        onPressed: () {
                          onPressed!(context, task, dogsitter);
                        },
                        widget: Text(buttonText!,
                            style: textTheme.bodyMedium!
                                .copyWith(color: AppColors.whiteColor)),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        // subtitle: Text(task.person.firstName!),
      ],
    );
  }
}
