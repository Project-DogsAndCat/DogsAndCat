import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/blocs/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_snackbar.dart';

class ListTasks extends StatelessWidget {
  const ListTasks({
    super.key,
    required this.onPressed,
    this.buttonText,
  });
  final String? buttonText;
  final Function(TaskModel task, BuildContext context) onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {
          state.maybeMap(
              failure: (state) {
                CustomSnackBar.showInfo(context, state.message);
              },
              loaded: (state) {
                if (state.tasks.isEmpty) {
                  CustomSnackBar.showInfo(
                      context, 'Пока нет ни одного предстоящего заказа');
                }
              },
              orElse: () {});
        },
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return state.map(
              loading: (_) => Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (state) => ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.tasks[index].serviceTitle),
                          Text(state.tasks[index].order.id!),
                          Text(state.tasks[index].order.price.toString()),
                          Text(state.tasks[index].order.date.toString()),
                          Text(state.tasks[index].order.status.value),
                          buttonText != null
                              ? RoundedElevatedButton(
                                  onPressed: () {
                                    onPressed(state.tasks[index], context);
                                  },
                                  widget: Text(buttonText!),
                                )
                              : Container(),
                        ],
                      ),
                      subtitle: Text(state.tasks[index].person.firstName!),
                    );
                  },
                  separatorBuilder: (context, _) {
                    return const SizedBox(
                      height: 10.0,
                    );
                  },
                  itemCount: state.tasks.length),
              failure: (state) => Container(),
            );
          },
        ),
      ),
    );
  }
}
