import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utils/app_strings.dart';
import 'container_widget.dart';

class CostDetailsWidget extends StatelessWidget {
  const CostDetailsWidget({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.costOfService,
                    style: textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    '${task.serviceTitle} ${task.order.duration}',
                    style: textTheme.labelSmall,
                  ),
                ],
              ),
              Text(
                '${task.order.price.toStringAsFixed(0)} руб',
                style: textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Divider(),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppString.forPayment,
                style: textTheme.labelMedium,
              ),
              Text(
                '${task.order.price.toStringAsFixed(0)} руб',
                style: textTheme.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
