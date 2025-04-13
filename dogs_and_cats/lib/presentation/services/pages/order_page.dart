import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: []),
      ),
    );
  }
}
