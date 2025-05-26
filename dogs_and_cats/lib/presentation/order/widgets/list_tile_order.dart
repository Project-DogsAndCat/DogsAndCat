import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:dogs_and_cats/presentation/order/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/theme.dart';
import '../order_bloc/order_bloc.dart';
import 'order_status_widget.dart';

class ListTileOrder extends StatelessWidget {
  const ListTileOrder({
    super.key,
    required this.task,
  });
  final TaskModel task;

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
                OrderStatusWidget(
                  status: task.order.status.value,
                ),
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
                Row(children: [
                  Text(
                    AppString.serviceFor,
                    style: textTheme.bodyLarge,
                  ),
                  SizedBox(
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
                      ]))
                ]),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  '${task.order.price.toStringAsFixed(0)} руб',
                  style: textTheme.labelMedium,
                ),
                if (task.order.status == Status.waiting)
                  Column(children: [
                    const SizedBox(height: 15.0),
                    GestureDetector(
                        child: Text(AppString.cancelOrder,
                            style: textTheme.bodyLarge!
                                .copyWith(color: AppColors.primaryColor)),
                        onTap: () {
                          context.read<OrderBloc>().add(
                              OrderEvent.cancelOrder(orderId: task.order.id!));
                        })
                  ]),
                const SizedBox(
                  height: 15.0,
                ),
                RoundedElevatedButton(
                  color: AppColors.backGroundColor,
                  widget: Text(
                    AppString.orderDetails,
                    style: textTheme.bodyMedium!
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  onPressed: () {
                    context.pushNamed(RoutesNames.orderDetails, extra: task);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
