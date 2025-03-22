import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:dogs_and_cats/presentation/pets/pages/properties_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_switch.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import '../blocs/pet_bloc.dart';

class EditPetPage extends StatefulWidget {
  const EditPetPage({super.key, required this.pet});
  final Pet pet;

  @override
  State<EditPetPage> createState() => _EditPetPageState();
}

class _EditPetPageState extends State<EditPetPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _breadController;
  late TextEditingController _ageController;
  late TextEditingController _weightController;
  late TextEditingController _featuresController;
  late TextEditingController _otherFeaturesController;
  late Set<String> _selectedCategory;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.pet.name);
    _breadController = TextEditingController(text: widget.pet.breed);
    _ageController = TextEditingController(text: widget.pet.age);
    _weightController =
        TextEditingController(text: widget.pet.weight.toString());
    _featuresController = TextEditingController(text: widget.pet.features);
    _otherFeaturesController =
        TextEditingController(text: widget.pet.otherFeatures);
    createSelectedCategory();
    super.initState();
  }

  void createSelectedCategory() {
    _selectedCategory = widget.pet.features
            ?.split(',')
            .map((element) => element.trim())
            .toSet() ??
        {};
  }

  @override
  void dispose() {
    _nameController.dispose();
    _breadController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _featuresController.dispose();
    super.dispose();
  }

  bool _isNeedProperties = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CustomTextFormField(
                    controller: _nameController,
                    hintText: AppString.nameOfPet,
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextFormField(
                    controller: _breadController,
                    hintText: AppString.breed,
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: _ageController,
                          hintText: AppString.age,
                          readOnly: true,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          controller: _weightController,
                          hintText: AppString.weight,
                          keyboardType: TextInputType.number,
                          validator: _validateWeight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Wrap(
                    spacing: 10.0,
                    children: [
                      ChoiceChip(
                        label: Text(AppString.boy),
                        showCheckmark: false,
                        selected: widget.pet.gender == AppString.boy,
                      ),
                      ChoiceChip(
                        label: Text(AppString.girl),
                        showCheckmark: false,
                        selected: widget.pet.gender == AppString.girl,
                      ),
                    ],
                  ),
                  CustomSwitch(
                    title: AppString.propertiesPet,
                    value: _isNeedProperties,
                    onChanged: (value) {
                      setState(() {
                        _isNeedProperties = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Visibility(
                    visible: _isNeedProperties,
                    child: PropertiesPage(
                      otherFeaturesController: _otherFeaturesController,
                      selectedCategory: _selectedCategory,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
            RoundedElevatedButton(
              widget: const Text(AppString.save),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context
                      .read<PetBloc>()
                      .add(PetEvent.edit(pet: createPetForEdit()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  PetEdit createPetForEdit() {
    return PetEdit(
        id: widget.pet.id!,
        features: widget.pet.features,
        otherFeatures: widget.pet.otherFeatures);
  }

  String? _validateWeight(String? value) {
    if (value?.isEmpty ?? true) return AppString.required;
    return null;
  }
}
