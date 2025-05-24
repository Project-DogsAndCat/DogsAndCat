import 'package:dogs_and_cats/core/dependency/dependencies.dart';
import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/blocs/distribution_bloc/disrtibution_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/blocs/task_bloc/task_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/widgets/list_tile_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_snackbar.dart';
import '../../../../domain/models/task.dart';

class ListTasks extends StatelessWidget {
  const ListTasks({
    super.key,
    required this.buttonText,
    required this.dogsitter,
    required this.onPressed,
  });
  final String buttonText;
  final Dogsitter dogsitter;
  final Function(
    BuildContext context,
    TaskModel task,
    Dogsitter dogsitter,
  )? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {
          state.maybeMap(
              failure: (state) {
                CustomSnackBar.showError(context, state.message);
              },
              loaded: (state) {
                if (state.tasks.isEmpty) {
                  CustomSnackBar.showInfo(context, 'Здесь пока ничего нет :)');
                }
              },
              orElse: () {});
        },
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return state.map(
              loading: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (state) => ListView.builder(
                  itemBuilder: (context, index) {
                    return BlocProvider(
                      create: (context) => getIt<DistributionBloc>(),
                      child: ListTileTask(
                        task: state.tasks[index],
                        buttonText: buttonText,
                        dogsitter: dogsitter,
                        onPressed: onPressed,
                      ),
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
