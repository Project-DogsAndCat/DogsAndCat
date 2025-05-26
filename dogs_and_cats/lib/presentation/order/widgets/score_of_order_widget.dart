import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgets/rating_bar_widget.dart';
import '../../../domain/models/score.dart';
import '../order_bloc/order_bloc.dart';

class ScoreOfOrderWidget extends StatelessWidget {
  const ScoreOfOrderWidget({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.0,
        ),
        Text(
          AppString.assess,
          style: textTheme.labelLarge,
        ),
        SizedBox(
          height: 15.0,
        ),
        RatingBarWidget(
          initialRating: task.score!.score,
          onRatingUpdate: (score) {
            context.read<OrderBloc>().add(OrderEvent.addScore(
                score: Score(
                    id: task.score?.id,
                    score: score,
                    orderId: task.order.id!,
                    dogsitterId: task.dogsitter!.id)));
          },
        ),
      ],
    );
  }
}
