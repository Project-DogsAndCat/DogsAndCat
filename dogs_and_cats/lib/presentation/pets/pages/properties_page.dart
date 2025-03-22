import 'package:dogs_and_cats/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../core/auxiliary_data/pet_properties.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage(
      {super.key,
      required TextEditingController otherFeaturesController,
      required Set<String> selectedCategory})
      : _otherFeaturesController = otherFeaturesController,
        _selectedCategory = selectedCategory;
  final TextEditingController _otherFeaturesController;
  final Set<String> _selectedCategory;

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
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
                  setState(() {
                    selected
                        ? widget._selectedCategory
                            .add(PetProperties.properties[index])
                        : widget._selectedCategory
                            .remove(PetProperties.properties[index]);
                  });
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
            setState(() {});
          },
          controller: widget._otherFeaturesController,
          keyboardType: TextInputType.text,
          hintText: 'Комментарий',
          maxLines: null,
          suffixIcon: widget._otherFeaturesController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget._otherFeaturesController.clear();
                    });
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
        )
      ],
    );
  }
}
