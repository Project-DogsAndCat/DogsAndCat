import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../order_bloc/order_bloc.dart';

class ListTileOrder extends StatelessWidget {
  const ListTileOrder({
    super.key,
    required this.order,
    required this.service,
  });
  final OrderModel order;
  final Service service;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(order.status.value),
        Text(service.title),
        const SizedBox(
          height: 10.0,
        ),
        GestureDetector(
          child: Text('Отменить заказ'),
          onTap: () {
            final orderCancel = order.copyWith(status: Status.refusal);
            context
                .read<OrderBloc>()
                .add(OrderEvent.cancelOrder(order: orderCancel));
          },
        )
      ],
    );
  }
}
