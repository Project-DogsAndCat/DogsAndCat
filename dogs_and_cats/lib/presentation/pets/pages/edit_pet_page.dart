import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/core/utils/calculate_age.dart';
import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:dogs_and_cats/presentation/pets/cubit/pet_edit_cubit.dart';
import 'package:dogs_and_cats/presentation/pets/pages/properties_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/theme.dart';
import '../../../core/widgets/custom_switch.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import '../../account/widgets/custom_choice_chip.dart';
import '../blocs/pet_bloc/pet_bloc.dart';

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

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.pet.name);
    _breadController = TextEditingController(text: widget.pet.breed);
    _ageController =
        TextEditingController(text: calculatingAge(widget.pet.dateBhD));
    _weightController =
        TextEditingController(text: widget.pet.weight.toString());
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _breadController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  bool _isNeedProperties = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PetEditCubit(pet: widget.pet),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.57),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(AppString.myPets, style: textTheme.labelLarge),
                  const SizedBox(
                    height: 20.0,
                  ),
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
                        Row(
                          spacing: 10.0,
                          children: [
                            CustomChoiceChip(
                              title: AppString.boy,
                              isSelected: widget.pet.gender == AppString.boy,
                            ),
                            CustomChoiceChip(
                              title: AppString.girl,
                              isSelected: widget.pet.gender == AppString.girl,
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
                          child: BlocBuilder<PetEditCubit, PetEditState>(
                              builder: (context, state) {
                            return PropertiesPage(
                              otherFeatures: state.otherFeatures ?? '',
                              selectedCategory: state.selectedCategory ?? {},
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<PetEditCubit, PetEditState>(
                    builder: (context, state) {
                      return RoundedElevatedButton(
                        widget: Text(
                          AppString.save,
                          style: textTheme.bodyMedium!
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<PetBloc>().add(PetEvent.edit(
                                pet: createPetForEdit(
                                    state.selectedCategoryString,
                                    state.otherFeatures)));
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PetEdit createPetForEdit(String? selectedCategory, String? otherFeatures) {
    return PetEdit(
        id: widget.pet.id!,
        selectedCategory: selectedCategory ?? '',
        otherFeatures: otherFeatures ?? '');
  }

  String? _validateWeight(String? value) {
    if (value?.isEmpty ?? true) return AppString.required;
    return null;
  }
}
