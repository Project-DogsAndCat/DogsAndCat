import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_text_form_field.dart';
import '../blocs/dog_breed_bloc/dog_breed_bloc.dart';

class DogBreedSearchPage extends StatelessWidget {
  const DogBreedSearchPage({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomTextFormField(
            onChanged: (text) {
              if (text.isNotEmpty) {
                context
                    .read<DogBreedBloc>()
                    .add(DogBreedEvent.runFilter(query: text));
              } else {
                context.read<DogBreedBloc>().add(DogBreedEvent.load());
              }
            },
            controller: controller,
            hintText: AppString.enterBreed,
            keyboardType: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Divider(height: 1),
        BlocBuilder<DogBreedBloc, DogBreedState>(builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loading: (_) => Center(
              child: CircularProgressIndicator(),
            ),
            success: (state) => Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.text = state.dogBreeds[index].name;
                      _onTapSearch(context);
                    },
                    child: Text(state.dogBreeds[index].name),
                  );
                },
                separatorBuilder: (context, _) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: state.dogBreeds.length,
              ),
            ),
            failure: (state) => Text(state.message),
          );
        }),
      ],
    );
  }

  void _onTapSearch(BuildContext context) {
    Navigator.of(context).pop(controller.text);
  }
}
