import 'package:dogs_and_cats/domain/models/pet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import '../blocs/pet_bloc.dart';

class EditPetPage extends StatefulWidget {
  const EditPetPage({super.key, required this.pet});
  static final _formKey = GlobalKey<FormState>();
  final Pet pet;

  @override
  State<EditPetPage> createState() => _EditPetPageState();
}

class _EditPetPageState extends State<EditPetPage> {
  late TextEditingController _nameController;
  late TextEditingController _breadController;
  late TextEditingController _ageController;
  late TextEditingController _weightController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.pet.name);
    _breadController = TextEditingController(text: widget.pet.breed);
    _ageController = TextEditingController(text: widget.pet.age);
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: EditPetPage._formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: _nameController,
              hintText: 'Имя питомца',
              keyboardType: TextInputType.name,
              obscureText: false,
              readOnly: true,
            ),
            SizedBox(
              height: 10.0,
            ),
            CustomTextFormField(
              controller: _breadController,
              hintText: 'Порода',
              keyboardType: TextInputType.text,
              obscureText: false,
              readOnly: true,
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
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    readOnly: true,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: CustomTextFormField(
                    controller: _weightController,
                    hintText: 'Вес',
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
                if (EditPetPage._formKey.currentState!.validate()) {
                  context.read<PetBloc>().add(PetEvent.edit(
                      id: widget.pet.id!, weight: _weightController.text));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
