import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/blocs/distribution_bloc/disrtibution_bloc.dart';
import 'package:dogs_and_cats/presentation/dogsitter/todo/widgets/list_tile_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_snackbar.dart';
import '../../../../domain/models/order.dart';
import '../../../../domain/models/task.dart';

class ListDistributions extends StatefulWidget {
  const ListDistributions({
    super.key,
    required this.dogsitter,
    required this.status,
    this.buttonText,
    this.onPressed,
  });
  final Dogsitter dogsitter;
  final Status status;
  final String? buttonText;
  final Function(
    BuildContext context,
    TaskModel task,
    Dogsitter dogsitter,
  )? onPressed;

  @override
  State<ListDistributions> createState() => _ListDistributionsState();
}

class _ListDistributionsState extends State<ListDistributions> {
  @override
  void initState() {
    context.read<DistributionBloc>().add(DistributionEvent.load(
        status: widget.status, dogsitter: widget.dogsitter));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<DistributionBloc, DistributionState>(
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
            orElse: () {},
          );
        },
        child: BlocBuilder<DistributionBloc, DistributionState>(
          builder: (context, state) {
            return state.map(
              loading: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (state) => ListView.separated(
                itemBuilder: (context, index) {
                  return ListTileTask(
                    task: state.tasks[index],
                    buttonText: widget.buttonText,
                    dogsitter: widget.dogsitter,
                    onPressed: widget.onPressed,
                  );
                },
                separatorBuilder: (context, _) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: state.tasks.length,
              ),
              failure: (state) => Container(),
            );
          },
        ),
      ),
    );
  }
}
