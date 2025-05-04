import 'package:dogs_and_cats/presentation/dogsitter/todo/blocs/task_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/pages/list_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency/dependencies.dart';
import '../../../../domain/models/task.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Заказы'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Все заказы'),
              Tab(text: 'Предстоящие'),
              Tab(text: 'Выполненные'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              create: (context) =>
                  getIt<TaskBloc>()..add(TaskEvent.loadAllTask()),
              child: ListTasks(
                  buttonText: 'Принять',
                  onPressed: (task, context) {
                    _acceptOrder(context, task);
                  }),
            ),
            BlocProvider(
              create: (context) =>
                  getIt<TaskBloc>()..add(TaskEvent.loadAcceptedTask()),
              child: ListTasks(
                buttonText: 'Выполнить',
                onPressed: (task, context) {
                  _completeOrder(context, task);
                },
              ),
            ),
            BlocProvider(
              create: (context) =>
                  getIt<TaskBloc>()..add(TaskEvent.loadCompletedTask()),
              child: ListTasks(
                onPressed: (task, context) {
                  _completeOrder(context, task);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _acceptOrder(BuildContext context, TaskModel task) {
    context.read<TaskBloc>().add(TaskEvent.accept(
          orderId: task.order.id!,
        ));
  }

  void _completeOrder(BuildContext context, TaskModel task) {
    context.read<TaskBloc>().add(TaskEvent.complete(
          orderId: task.order.id!,
        ));
  }
}
