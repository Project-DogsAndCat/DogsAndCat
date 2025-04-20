import 'package:dogs_and_cats/domain/models/service.dart';
import 'package:dogs_and_cats/presentation/services/service_bloc/services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PositionsList extends StatelessWidget {
  const PositionsList({
    super.key,
    required this.selectedServices,
    required this.onChanged,
  });
  final Set<Service> selectedServices;
  final Function(Service, bool isSelected) onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        return state.map(
            loading: (_) => Center(
                  child: CircularProgressIndicator(),
                ),
            loaded: (state) {
              return Expanded(
                child: Wrap(
                  children: List<Widget>.generate(
                    state.service.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        showCheckmark: false,
                        label: Text(state.service[index].title),
                        selected:
                            selectedServices.contains(state.service[index]),
                        onSelected: (bool selected) {
                          onChanged(state.service[index], selected);
                        },
                      ),
                    ),
                  ).toList(),
                ),
              );
            },
            loadedService: (_) => Container(),
            failure: (state) => Text(state.message));
      },
    );
  }
}
