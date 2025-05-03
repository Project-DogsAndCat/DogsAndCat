import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/models/task.dart';
import 'package:dogs_and_cats/presentation/dogsitter/adding_information/blocs/dog_sitter_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/blocs/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListTasks extends StatefulWidget {
  const ListTasks({
    super.key,
    required this.status,
    this.statusForUpdate,
  });
  final Status status;
  final Status? statusForUpdate;

  @override
  State<ListTasks> createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(TaskEvent.load(status: widget.status));
    context.read<DogSitterBloc>().add(DogSitterEvent.load());
  }

  @override
  void didUpdateWidget(ListTasks oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.status != widget.status) {
      final bloc = context.read<TaskBloc>();
      if (bloc.isClosed) {
        bloc.add(TaskEvent.load(status: widget.status));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskBloc, TaskState>(
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
                        RoundedElevatedButton(
                          onPressed: () {
                            if (widget.statusForUpdate != null) {
                              _acceptOrder(context, state.tasks[index]);
                            }
                          },
                          widget: Text('Принять'),
                        ),
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
            failure: (state) => Center(
              child: Text(state.message),
            ),
          );
        },
      ),
    );
  }

  void _acceptOrder(BuildContext context, TaskModel task) {
    final dogsitter = context.read<DogSitterBloc>().dogsiterrInfo;

    context.read<TaskBloc>().add(TaskEvent.accept(
          prevStatus: task.order.status,
          newStatus: widget.statusForUpdate!,
          orderId: task.order.id!,
        ));

    context
        .read<DogSitterBloc>()
        .add(DogSitterEvent.updateStatus(currentStatus: dogsitter!.status));
  }
}
