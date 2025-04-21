import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/presentation/order/order_bloc/order_bloc.dart';
import 'package:dogs_and_cats/presentation/order/widgets/list_tile_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context
                  .read<OrderBloc>()
                  .add(OrderEvent.load(status: Status.waiting)),
              child: Text('Фильтр'),
            ),
            Expanded(
              child: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  return state.map(
                    loading: (_) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (state) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTileOrder(
                            order: state.orders[index],
                            service: state.services[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10.0,
                          );
                        },
                        itemCount: state.orders.length,
                      );
                    },
                    failure: (state) => Text(state.message),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
