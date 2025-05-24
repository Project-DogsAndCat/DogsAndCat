import 'package:dogs_and_cats/presentation/order/order_bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_snackbar.dart';
import '../widgets/list_tile_order.dart';

class ListOfAllOrders extends StatelessWidget {
  const ListOfAllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        state.map(
          successAddScore: (_) {},
          initial: (_) {},
          loading: (_) {},
          loaded: (state) {
            if (state.tasks.isEmpty) {
              CustomSnackBar.showInfo(context, 'Здесь пока ничего нет :)');
            }
          },
          failure: (state) {
            CustomSnackBar.showInfo(context, state.message);
          },
        );
      },
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                return state.map(
                  initial: (_) => Container(),
                  successAddScore: (_) => Container(),
                  loading: (_) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (state) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTileOrder(
                          task: state.tasks[index],
                          // service: state.services[index],
                        );
                      },
                      itemCount: state.tasks.length,
                    );
                  },
                  failure: (state) => Text(state.message),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
