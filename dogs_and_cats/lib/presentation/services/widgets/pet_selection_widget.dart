import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetSelectionWidget extends StatefulWidget {
  final Function(int?, String) onSelected;

  const PetSelectionWidget({
    super.key,
    required this.onSelected,
  });

  @override
  State<PetSelectionWidget> createState() => _PetSelectionWidgetState();
}

class _PetSelectionWidgetState extends State<PetSelectionWidget> {
  int? _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetBloc, PetState>(
      builder: (context, state) {
        return state.map(
          loading: (_) => Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (value) => Wrap(
            spacing: 5.0,
            children: List.generate(value.pets.length, (int index) {
              return ChoiceChip(
                label: Column(
                  children: [
                    Text(value.pets[index].name),
                  ],
                ),
                selected: _selectedValue == index,
                onSelected: (bool selected) {
                  widget.onSelected(_selectedValue = selected ? index : null,
                      value.pets[index].id!);
                },
                showCheckmark: false,
                selectedColor: AppColors.primaryColor,
              );
            }).toList(),
          ),
          failure: (value) => Text(value.message),
        );
      },
    );
  }
}
