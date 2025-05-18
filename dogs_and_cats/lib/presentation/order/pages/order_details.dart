import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/presentation/order/order_bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../domain/models/task.dart';
import '../widgets/container_widget.dart';
import '../widgets/order_status_widget.dart';

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
            context.replaceNamed(RoutesNames.order);
          },
        ),
      ),
      body: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          state.mapOrNull(successAddRating: (_) {
            CustomSnackBar.showSuccess(context, AppString.scoreService);
          });
        },
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10.0,
              ),
              OrderStatusWidget(
                status: task.order.status.value,
              ),
              SizedBox(
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
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: task.pet.length,
                separatorBuilder: (_, __) => const SizedBox(height: 5),
                itemBuilder: (_, index) => ContainerWidget(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.pet[index].name,
                        style: textTheme.labelMedium,
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        task.pet[index].selectedCategory.isEmpty
                            ? 'Без особенностей'
                            : task.pet[index].selectedCategory,
                        style: textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ),
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
              ContainerWidget(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildServiceInfo(),
                        Text(
                          '${task.order.price.toStringAsFixed(0)} руб',
                          style: textTheme.labelMedium,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPriceRow(),
                  ],
                ),
              ),
              if (task.order.status.value == Status.complete.value)
                RatingBar.builder(
                  itemSize: 25,
                  initialRating: task.order.score ?? 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    context.read<OrderBloc>().add(OrderEvent.addRating(
                        rating: rating,
                        dogsitterId: task.dogsitter!.id,
                        orderId: task.order.id!));
                  },
                ),
            ]),
          ),
        ),
      ),
    );
  }

  _buildServiceInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.costOfService,
          style: textTheme.labelMedium,
        ),
        const SizedBox(
          height: 3.0,
        ),
        Text(
          '${task.serviceTitle} ${task.order.duration}',
          style: textTheme.labelSmall,
        ),
      ],
    );
  }

  _buildPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString.forPayment,
          style: textTheme.labelMedium,
        ),
        Text(
          '${task.order.price.toStringAsFixed(0)} руб',
          style: textTheme.labelMedium,
        ),
      ],
    );
  }
}
