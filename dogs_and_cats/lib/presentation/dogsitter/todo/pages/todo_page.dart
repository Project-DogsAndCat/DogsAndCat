import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/blocs/task_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/pages/list_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency/dependencies.dart';

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
            labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Заказы',
              ),
              Tab(
                text: 'Предстоящие',
              ),
              Tab(
                text: 'Выполненные',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocProvider(
              create: (context) => getIt<TaskBloc>(),
              child: ListTasks(
                status: Status.waiting,
                statusForUpdate: Status.adopted,
              ),
            ),
            BlocProvider(
              create: (context) => getIt<TaskBloc>(),
              child: ListTasks(
                status: Status.adopted,
                statusForUpdate: Status.done,
              ),
            ),
            BlocProvider(
              create: (context) => getIt<TaskBloc>(),
              child: ListTasks(
                status: Status.done,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
