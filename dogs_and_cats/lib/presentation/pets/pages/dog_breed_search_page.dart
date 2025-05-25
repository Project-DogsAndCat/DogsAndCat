import 'package:dogs_and_cats/core/theme/theme.dart';
import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../blocs/dog_breed_bloc/dog_breed_bloc.dart';

class DogBreedSearchPage extends StatefulWidget {
  const DogBreedSearchPage({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<DogBreedSearchPage> createState() => _DogBreedSearchPageState();
}

class _DogBreedSearchPageState extends State<DogBreedSearchPage> {
  @override
  void initState() {
    context.read<DogBreedBloc>().add(DogBreedEvent.load());
    super.initState();
  }

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
            controller: widget.controller,
            hintText: AppString.enterBreed,
            keyboardType: TextInputType.text,
            suffixIcon: Icon(Icons.search),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Divider(
          color: AppColors.greyColor,
          thickness: 0.5,
        ),
        SizedBox(
          height: 20,
        ),
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
                      widget.controller.text = state.dogBreeds[index].name;
                      _onTapSearch(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.dogBreeds[index].name,
                            style: textTheme.labelMedium,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: AppColors.greyColor,
                            thickness: 0.5,
                          ),
                        ],
                      ),
                    ),
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
    Navigator.of(context).pop(widget.controller.text);
  }
}
