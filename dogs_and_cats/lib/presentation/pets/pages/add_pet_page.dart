import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../domain/models/pet.dart';
import '../blocs/pet_bloc.dart';

class AddPetPage extends StatefulWidget {
  const AddPetPage({super.key});
  static final _formKey = GlobalKey<FormState>();

  @override
  State<AddPetPage> createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  bool? _isBoy = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: AddPetPage._formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              obscureText: false,
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomTextFormField(
              controller: _breedController,
              hintText: AppString.breed,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppString.required;
                }
                return null;
              },
              keyboardType: TextInputType.text,
              obscureText: false,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CustomTextFormField(
                        readOnly: true,
                        controller: _ageController,
                        hintText: AppString.age,
                        validator: (_) {
                          if (_ageController.text.isEmpty) {
                            return AppString.required;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                      Positioned.fill(
                        child: LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return GestureDetector(
                            onTap: () async {
                              DateTime now = DateTime.now();
                              final dateBhd =
                                  await DatePicker.showSimpleDatePicker(
                                context,
                                firstDate: DateTime(now.year - 30),
                                lastDate: now,
                                dateFormat: "dd-MMMM-yyyy",
                                locale: DateTimePickerLocale.ru,
                                looping: true,
                              );

                              if (dateBhd != null) {
                                _ageController.text = _calculatingAge(dateBhd);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(25.0)),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: CustomTextFormField(
                    controller: _weightController,
                    hintText: AppString.weight,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppString.required;
                      }
                      if (double.tryParse(value) == null) {
                        return AppString.required;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 10.0,
              children: [
                ChoiceChip(
                  label: Text(AppString.boy),
                  showCheckmark: false,
                  selected: _isBoy == true,
                  onSelected: (bool selected) {
                    setState(() {
                      _isBoy = selected ? true : false;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text(AppString.girl),
                  showCheckmark: false,
                  selected: _isBoy == false,
                  onSelected: (bool selected) {
                    setState(() {
                      _isBoy = selected ? false : true;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            RoundedElevatedButton(
              widget: const Text(AppString.save),
              onPressed: () {
                if (AddPetPage._formKey.currentState!.validate() &&
                    _isBoy != null) {
                  Pet pet = Pet(
                      name: _nameController.text,
                      breed: _breedController.text,
                      age: _ageController.text,
                      weight: int.parse(_weightController.text),
                      gender: _isBoy! ? AppString.boy : AppString.girl);
                  context.read<PetBloc>().add(PetEvent.add(pet: pet));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

String _calculatingAge(DateTime dateBhd) {
  DateTime today = DateTime.now();
  final year = _formatingYear(today.year - dateBhd.year);
  int mth = today.month - dateBhd.month;
  if (mth < 0) mth = 12 + mth;
  return '$year $mth мес.';
}

String _formatingYear(int year) {
  if (year % 10 == 1 && year != 11) return '$year год';
  if (year % 10 > 1 && year % 10 < 5) {
    return '$year года';
  } else {
    return '$year лет';
  }
}
