import 'package:dogs_and_cats/core/theme/theme.dart';
import 'package:dogs_and_cats/presentation/account/widgets/custom_choice_chip.dart';
import 'package:dogs_and_cats/presentation/pets/cubit/pet_edit_cubit.dart';
import 'package:dogs_and_cats/presentation/pets/pages/dog_breed_search_page.dart';
import 'package:dogs_and_cats/presentation/pets/pages/properties_page.dart';
import 'package:dogs_and_cats/presentation/pets/widgets/button_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_switch.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import '../../../domain/models/pet.dart';
import '../blocs/pet_bloc/pet_bloc.dart';
import '../widgets/date_picker.dart';

class AddPetPage extends StatefulWidget {
  const AddPetPage({super.key});

  @override
  State<AddPetPage> createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dogBreedController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  DateTime bHDay = DateTime.now();

  @override
  void dispose() {
    _nameController.dispose();
    _dogBreedController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  bool? _isBoy = true;
  bool _isNeedProperties = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PetEditCubit(),
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppString.required;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SearchButton(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              elevation: 0,
                              context: context,
                              builder: (context) => SizedBox(
                                height: MediaQuery.of(context).size.height - 80,
                                child: DogBreedSearchPage(
                                  controller: _dogBreedController,
                                ),
                              ),
                            );
                          },
                          controller: _dogBreedController,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomTextFormField(
                                    readOnly: true,
                                    controller: _ageController,
                                    hintText: AppString.age,
                                    validator: _validateAge,
                                  ),
                                  Positioned.fill(
                                    child: MyDatePicker(
                                      ageController: _ageController,
                                      changeDateBhD: (value) {
                                        setState(() {
                                          bHDay = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: CustomTextFormField(
                                controller: _weightController,
                                hintText: AppString.weight,
                                validator: _validateWeight,
                                keyboardType: TextInputType.number,
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
                              isSelected: _isBoy == true,
                              onSelected: (bool isBoy) {
                                setState(() {
                                  _isBoy = isBoy ? true : false;
                                });
                              },
                            ),
                            CustomChoiceChip(
                              title: AppString.girl,
                              isSelected: _isBoy == false,
                              onSelected: (bool isBoy) {
                                setState(() {
                                  _isBoy = isBoy ? false : true;
                                });
                              },
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
                            },
                          ),
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
                          if (_formKey.currentState!.validate() &&
                              _isBoy != null) {
                            Pet pet = createPet(state.selectedCategoryString,
                                state.otherFeatures);
                            context.read<PetBloc>().add(PetEvent.add(pet: pet));
                            Navigator.pop(context);
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

  Pet createPet(String? selectedCategory, String? otherFeatures) {
    Pet pet = Pet(
        name: _nameController.text,
        breed: _dogBreedController.text,
        dateBhD: bHDay,
        weight: int.parse(_weightController.text),
        gender: _isBoy! ? AppString.boy : AppString.girl,
        selectedCategory: selectedCategory ?? '',
        otherFeatures: otherFeatures ?? '');
    return pet;
  }

  String? _validateAge(String? value) {
    if (value?.isEmpty ?? true) return AppString.required;
    return null;
  }

  String? _validateWeight(String? value) {
    if (value?.isEmpty ?? true) return AppString.required;
    return null;
  }
}
