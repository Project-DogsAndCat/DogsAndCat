import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class AddPetPage extends StatelessWidget {
  AddPetPage({super.key});
  final _nameController = TextEditingController();
  final _breadController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
                  child: CustomTextFormField(
                    controller: _ageController,
                    hintText: 'Возраст',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppString.required;
                      }
                      if (int.tryParse(value) == null) {
                        return AppString.required;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: false,
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
                if (_formKey.currentState!.validate()) {
                  Pet pet = Pet(
                      name: _nameController.text,
                      breed: _breadController.text,
                      age: int.parse(_ageController.text),
                      weight: double.parse(_weightController.text),
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
