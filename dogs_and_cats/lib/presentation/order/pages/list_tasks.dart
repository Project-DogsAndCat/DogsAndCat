import 'package:dogs_and_cats/core/dependency/dependencies.dart';
import 'package:dogs_and_cats/presentation/order/order_bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_of_all_orders.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Заказ'),
          bottom: const TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
            isScrollable: true,
            tabs: [
              Tab(text: 'Все'),
              Tab(text: 'Предстоящие'),
              Tab(text: 'Выполненные'),
              Tab(text: 'Отмененные'),
            ],
          ),
        ),
        body: TabBarView(children: [
          BlocProvider(
            create: (context) =>
                getIt<OrderBloc>()..add(OrderEvent.loadAllOrders()),
            child: ListOfAllOrders(),
          ),
          BlocProvider(
            create: (context) =>
                getIt<OrderBloc>()..add(OrderEvent.loadAdoptedOrders()),
            child: ListOfAllOrders(),
          ),
          BlocProvider(
            create: (context) =>
                getIt<OrderBloc>()..add(OrderEvent.loadCompletedOrders()),
            child: ListOfAllOrders(),
          ),
          BlocProvider(
            create: (context) =>
                getIt<OrderBloc>()..add(OrderEvent.loadRefusalOrders()),
            child: ListOfAllOrders(),
          ),
        ]),
      ),
    );
  }
}
