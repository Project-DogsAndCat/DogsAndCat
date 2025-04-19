import 'package:dogs_and_cats/presentation/dogsitter/adding_information/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/positions.dart';
import '../../../../core/widgets/rounded_elevated_button.dart';
import '../../../auth/widgets/custom_snackbar.dart';
import '../../adding_information/blocs/information_dog_sitter_bloc.dart';
import '../widgets/drop_down_button_field.dart';

class AddInformation extends StatefulWidget {
  const AddInformation({super.key});

  @override
  State<AddInformation> createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  String? _selectedPosition;
  String? _imageUrl;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child:
              BlocListener<InformationDogSitterBloc, InformationDogSitterState>(
            listener: (context, state) {
              state.map(
                initial: (_) {},
                loading: (_) {},
                loaded: (_) {
                  CustomSnackBar.showSuccess(context, AppString.loginSuccess);
                  context.goNamed(RoutesNames.account);
                },
                failure: (state) {
                  CustomSnackBar.showError(context, state.message);
                },
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Avatar(imageUrl: _imageUrl),
                const SizedBox(
                  height: 10.0,
                ),
                PositionDropDownButtonField(
                  selectedValue:
                      _selectedPosition ?? dropdownItems.first.value!,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedPosition = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RoundedElevatedButton(
                  onPressed: () {
                    if (_selectedPosition != null) {
                      context.read<InformationDogSitterBloc>().add(
                          InformationDogSitterEvent.addInformation(
                              position: _selectedPosition!));
                    }
                  },
                  widget: BlocBuilder<InformationDogSitterBloc,
                      InformationDogSitterState>(
                    builder: (context, state) {
                      return state.maybeMap(
                        loading: (_) {
                          return CircularProgressIndicator(
                            color: Colors.white,
                          );
                        },
                        orElse: () {
                          return Text(
                            AppString.save,
                            style: const TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
