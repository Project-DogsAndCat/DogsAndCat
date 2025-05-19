import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/presentation/dogsitter/adding_information/blocs/dog_sitter_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/blocs/distribution_bloc/disrtibution_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/blocs/task_bloc/task_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/pages/list_distributions.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/pages/list_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency/dependencies.dart';
import '../../../../domain/models/task.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    context.read<DogSitterBloc>().add(DogSitterEvent.load());
    super.initState();
  }

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
        body: BlocBuilder<DogSitterBloc, DogSitterState>(
          builder: (context, state) {
            return state.map(
                initial: (_) => Container(),
                loading: (_) => Container(),
                loaded: (state) => TabBarView(
                      children: [
                        BlocProvider(
                          create: (context) => getIt<TaskBloc>()
                            ..add(TaskEvent.initialize(
                                dogsitter: state.dogsitter)),
                          child: ListTasks(
                              buttonText: 'Принять',
                              dogsitter: state.dogsitter,
                              onPressed: (context, task, dogsitter) {
                                _acceptOrder(context, task, dogsitter);
                              }),
                        ),
                        BlocProvider(
                          create: (context) => getIt<DistributionBloc>(),
                          child: ListDistributions(
                              status: Status.adopted,
                              buttonText: 'Выполнить',
                              dogsitter: state.dogsitter,
                              onPressed: (context, task, dogsitter) {
                                _completeOrder(context, task, dogsitter);
                              }),
                        ),
                        BlocProvider(
                          create: (context) => getIt<DistributionBloc>(),
                          child: ListDistributions(
                            status: Status.complete,
                            dogsitter: state.dogsitter,
                          ),
                        ),
                      ],
                    ),
                failure: (state) => Center(
                      child: Text(state.message),
                    ));
          },
        ),
      ),
    );
  }

  void _acceptOrder(BuildContext context, TaskModel task, Dogsitter dogsitter) {
    context.read<DistributionBloc>().add(DistributionEvent.accept(
          orderId: task.order.id!,
          person: task.person,
          dogsitter: dogsitter,
        ));
    context
        .read<DogSitterBloc>()
        .add(DogSitterEvent.updateStatus(status: StatusDogSitter.busy));
  }

  void _completeOrder(
      BuildContext context, TaskModel task, Dogsitter dogsitter) {
    context.read<DistributionBloc>().add(DistributionEvent.complete(
        orderId: task.order.id!, dogsitter: dogsitter));
    context
        .read<DogSitterBloc>()
        .add(DogSitterEvent.updateStatus(status: StatusDogSitter.free));
  }
}
