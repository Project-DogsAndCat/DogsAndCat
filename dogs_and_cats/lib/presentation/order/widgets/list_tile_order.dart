import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:flutter/material.dart';

class ListTileOrder extends StatelessWidget {
  const ListTileOrder({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(order.status!.value),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
