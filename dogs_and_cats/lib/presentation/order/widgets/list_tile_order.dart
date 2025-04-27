import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        Text(task.serviceTitle),
        Text(task.order.date.toString()),
        Text(task.order.id ?? 'null'),
        Text(task.order.duration),
        Text(task.order.status.value),
        Text(task.order.price.toString()),
        const SizedBox(
          height: 10.0,
        ),
        GestureDetector(
          child: Text('Отменить заказ'),
          onTap: () {
            final orderCancel = task.order.copyWith(status: Status.refusal);
            context
                .read<OrderBloc>()
                .add(OrderEvent.cancelOrder(order: orderCancel));
          },
        )
      ],
    );
  }
}
