import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetSelectionWidget extends StatefulWidget {
  final Function(List<String>, List<String>) onSelected;

  const PetSelectionWidget({
    super.key,
    required this.onSelected,
  });

  @override
  State<PetSelectionWidget> createState() => _PetSelectionWidgetState();
}

class _PetSelectionWidgetState extends State<PetSelectionWidget> {
  final List<String> _selectedPetIds = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetBloc, PetState>(
      builder: (context, state) {
        return state.map(
          loading: (_) => Center(child: CircularProgressIndicator()),
          loaded: (value) => Wrap(
            spacing: 5.0,
            children: List.generate(value.pets.length, (int index) {
              return ChoiceChip(
                label: Text(value.pets[index].name),
                selected: _selectedPetIds.contains(value.pets[index].id),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedPetIds.add(value.pets[index].id!);
                    } else {
                      _selectedPetIds.remove(value.pets[index].id!);
                    }
                  });
                  final selectedNames = value.pets
                      .where((p) => _selectedPetIds.contains(p.id))
                      .map((p) => p.name)
                      .toList();
                  widget.onSelected(_selectedPetIds, selectedNames);
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
