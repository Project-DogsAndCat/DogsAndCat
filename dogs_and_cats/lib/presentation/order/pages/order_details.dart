import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/models/score.dart';
import 'package:dogs_and_cats/presentation/order/order_bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../widgets/cost_details_widget.dart';
import '../widgets/pet_name_list_view_widget.dart';
import '../../../core/widgets/rating_bar_widget.dart';
import '../../../domain/models/task.dart';
import '../widgets/container_widget.dart';
import '../widgets/order_status_widget.dart';
import '../widgets/score_of_order_widget.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.orderDetails,
          style: textTheme.titleMedium,
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            context.pop(RoutesNames.order);
          },
        ),
      ),
      body: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          state.mapOrNull(successAddScore: (_) {
            CustomSnackBar.showSuccess(context, AppString.scoreService);
          });
        },
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 10.0,
              ),
              OrderStatusWidget(
                status: task.order.status.value,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                task.serviceTitle,
                style: textTheme.labelLarge,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                '${DateFormat.MMMMEEEEd('RU-ru').format(task.order.date)}, ${DateFormat.Hm('RU-ru').format(task.order.date)}',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                AppString.serviceFor,
                style: textTheme.labelLarge,
              ),
              const SizedBox(
                height: 10.0,
              ),
              PetNameListViewWidget(task: task),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                AppString.ordering,
                style: textTheme.labelLarge,
              ),
              const SizedBox(
                height: 10.0,
              ),
              CostDetailsWidget(task: task),
              if (task.order.status.value == Status.complete.value)
                ScoreOfOrderWidget(task: task),
            ]),
          ),
        ),
      ),
    );
  }
}
