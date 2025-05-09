import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/presentation/order/order_bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../domain/models/task.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (widget.task.order.status.value == Status.complete.value)
              RatingBar.builder(
                itemSize: 25,
                initialRating: widget.task.order.score ?? 0,
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
                      dogsitterId: widget.task.dogsitter!.id,
                      orderId: widget.task.order.id!));
                },
              ),
          ]),
        ),
      ),
    );
  }
}
