import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/theme.dart';
import '../order_bloc/order_bloc.dart';

class ListTileOrder extends StatelessWidget {
  const ListTileOrder({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(task.person.firstName!),
        Text(task.serviceTitle),
        Text(task.order.date.toString()),
        Text(task.order.id!),
        Text(task.order.duration),
        Text(task.order.status.value),
        Text(task.order.price.toString()),
        Text(task.dogsitter?.id ?? 'null'),
        Text(task.dogsitter?.rating.toString() ?? 'null'),
        const SizedBox(
          height: 10.0,
        ),
        RoundedElevatedButton(
          widget: Text(
            'Детали заказа',
            style: textTheme.bodyMedium!.copyWith(color: AppColors.whiteColor),
          ),
          onPressed: () {
            context.replaceNamed(RoutesNames.orderDetails, extra: task);
          },
        ),
        GestureDetector(
          child: Text('Отменить заказ'),
          onTap: () {
            context
                .read<OrderBloc>()
                .add(OrderEvent.cancelOrder(orderId: task.order.id!));
          },
        )
      ],
    );
  }
}
