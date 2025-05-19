import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/theme.dart';

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
  void initState() {
    context.read<PetBloc>().add(PetEvent.load());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetBloc, PetState>(
      builder: (context, state) {
        return state.map(
          loading: (_) => Center(child: CircularProgressIndicator()),
          loaded: (value) => Wrap(
            spacing: 5.0,
            children: List.generate(value.pets.length, (int index) {
              bool isSelected = _selectedPetIds.contains(value.pets[index].id);
              return ChoiceChip(
                label: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(value.pets[index].name),
                ),
                selected: isSelected,
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
                labelStyle: isSelected
                    ? textTheme.bodyLarge!.copyWith(color: AppColors.whiteColor)
                    : textTheme.bodyLarge,
                selectedColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: const BorderSide(color: Colors.transparent),
                ),
              );
            }).toList(),
          ),
          failure: (value) => Text(value.message),
        );
      },
    );
  }
}
