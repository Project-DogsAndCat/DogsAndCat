import 'package:dogs_and_cats/presentation/order/order_bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/order.dart';
import '../widgets/list_tile_order.dart';

class ListOfAllOrders extends StatefulWidget {
  const ListOfAllOrders({super.key, this.status});
  final Status? status;

  @override
  State<ListOfAllOrders> createState() => _ListOfAllOrdersState();
}

class _ListOfAllOrdersState extends State<ListOfAllOrders> {
  late final OrderBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<OrderBloc>()
      ..add(OrderEvent.load(status: widget.status));
  }

  @override
  void didUpdateWidget(ListOfAllOrders oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.status != widget.status) {
      _bloc.add(OrderEvent.load(status: widget.status));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return state.map(
                loading: (_) => Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (state) {
                  return ListView.separated(
                    key: ValueKey(widget.status),
                    itemBuilder: (context, index) {
                      return ListTileOrder(
                        order: state.orders[index],
                        service: state.services[index],
                      );
                    },
                    separatorBuilder: (context, _) {
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
    );
  }
}
