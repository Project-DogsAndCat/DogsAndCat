import 'package:dogs_and_cats/presentation/dogsitter/todo/blocs/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

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
                        Text(state.tasks[index].order.duration),
                        Text(state.tasks[index].order.price.toString()),
                        Text(state.tasks[index].order.date.toString()),
                        Text(state.tasks[index].order.status.value),
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
}
