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
  final _breadController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _breadController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    super.dispose();
  }

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
              hintText: 'Имя питомца',
              validator: (value) {
                if (value!.isEmpty) {
                  return AppString.required;
                }
                return null;
              },
              keyboardType: TextInputType.name,
              obscureText: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomTextFormField(
              controller: _breadController,
              hintText: 'Порода',
              validator: (value) {
                if (value!.isEmpty) {
                  return AppString.required;
                }
                return null;
              },
              keyboardType: TextInputType.text,
              obscureText: false,
            ),
            SizedBox(
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
                        hintText: 'Возраст',
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
                                firstDate: DateTime(now.year - 20),
                                lastDate: DateTime.now(),
                                dateFormat: "dd-MMMM-yyyy",
                                locale: DateTimePickerLocale.ru,
                                looping: true,
                              );

                              _ageController.text = _calculatingAge(dateBhd!);
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
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: CustomTextFormField(
                    controller: _weightController,
                    hintText: 'Вес',
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
            SizedBox(height: 25.0),
            RoundedElevatedButton(
              widget: Text('Сохранить'),
              onPressed: () {
                if (AddPetPage._formKey.currentState!.validate()) {
                  Pet pet = Pet(
                      name: _nameController.text,
                      breed: _breadController.text,
                      age: _ageController.text,
                      weight: int.parse(_weightController.text),
                      gender: 'gender');
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
  DateTime dateTimeNow = DateTime.now();
  final year = (dateTimeNow.difference(dateBhd).inDays ~/ 365);
  final month = (dateTimeNow.difference(dateBhd).inDays ~/ 30) - 12 * year;
  final numberOfYear = _formatingYear(year);
  return '$numberOfYear $month мес.';
}

String _formatingYear(int year) {
  if (year == 1) return '$year год';
  if (year > 1 && year < 5) {
    return '$year года';
  } else {
    return '$year лет';
  }
}
