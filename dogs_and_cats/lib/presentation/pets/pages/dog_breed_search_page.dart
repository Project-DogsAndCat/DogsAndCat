import 'package:dogs_and_cats/core/widgets/custom_text_form_field.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/dog_breed_bloc/dog_breed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogBreedSearchPage extends StatelessWidget {
  const DogBreedSearchPage({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            controller: controller,
            hintText: 'hintText',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10.0,
          ),
          BlocBuilder<DogBreedBloc, DogBreedState>(builder: (context, state) {
            return state.map(
              initial: (_) => Container(),
              loading: (_) => Center(
                child: CircularProgressIndicator(),
              ),
              success: (state) => ListView.separated(
                  itemBuilder: (context, index) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.text = state.dogBreeds[index].name;
                          },
                          child: Text(state.dogBreeds[index].name),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10.0,
                        );
                      },
                      itemCount: state.dogBreeds.length,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10.0,
                    );
                  },
                  itemCount: state.dogBreeds.length),
              failure: (state) => Text(state.message),
            );
          }),
        ],
      ),
    );
  }
}
