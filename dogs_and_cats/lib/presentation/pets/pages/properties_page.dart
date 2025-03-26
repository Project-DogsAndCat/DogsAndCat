import 'package:dogs_and_cats/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/auxiliary_data/pet_properties.dart';
import '../cubit/pet_edit_cubit.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage(
      {super.key,
      required String otherFeatures,
      required Set<String> selectedCategory})
      : _otherFeatures = otherFeatures,
        _selectedCategory = selectedCategory;
  final String _otherFeatures;
  final Set<String> _selectedCategory;

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  late TextEditingController _otherFeaturesController;

  @override
  void initState() {
    _otherFeaturesController =
        TextEditingController(text: widget._otherFeatures);
    super.initState();
  }

  @override
  void dispose() {
    _otherFeaturesController.dispose();
    widget._selectedCategory.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('К чему нам нужно быть готовым?'),
        Wrap(
          children: List<Widget>.generate(
            PetProperties.properties.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ChoiceChip(
                showCheckmark: false,
                label: Text(PetProperties.properties[index]),
                selected: widget._selectedCategory
                    .contains(PetProperties.properties[index]),
                onSelected: (bool selected) {
                  _chooseCategory(selected, index);
                  _updateProperties(selectedCategory: widget._selectedCategory);
                },
              ),
            ),
          ).toList(),
        ),
        const SizedBox(
          height: 10.0,
        ),
        CustomTextFormField(
          onChanged: (text) {
            _updateProperties(otherFeatures: _otherFeaturesController.text);
          },
          controller: _otherFeaturesController,
          keyboardType: TextInputType.text,
          hintText: 'Комментарий',
          maxLines: null,
          suffixIcon: _otherFeaturesController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _otherFeaturesController.clear();
                    });
                    _updateProperties(
                        otherFeatures: _otherFeaturesController.text);
                  },
                  icon: const Icon(Icons.clear))
              : null,
        )
      ],
    );
  }

  void _chooseCategory(bool selected, int index) {
    selected
        ? widget._selectedCategory.add(PetProperties.properties[index])
        : widget._selectedCategory.remove(PetProperties.properties[index]);
  }

  void _updateProperties(
      {String? otherFeatures, Set<String>? selectedCategory}) {
    context.read<PetEditCubit>().updateFeatures(
        otherFeatures: otherFeatures, selectedCategory: selectedCategory);
  }
}
