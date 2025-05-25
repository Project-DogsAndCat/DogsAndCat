import 'package:dogs_and_cats/presentation/dogsitter/adding_information/cubits/image_cubit.dart';
import 'package:dogs_and_cats/presentation/dogsitter/adding_information/widgets/avatar.dart';
import 'package:dogs_and_cats/presentation/dogsitter/adding_information/widgets/positions_list.dart';
import 'package:dogs_and_cats/presentation/services/service_bloc/services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dependency/dependencies.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_snackbar.dart';
import '../../../../core/widgets/rounded_elevated_button.dart';
import '../../../../domain/models/service.dart';
import '../../adding_information/blocs/dog_sitter_bloc.dart';

class AddInformation extends StatefulWidget {
  const AddInformation({super.key});

  @override
  State<AddInformation> createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  final Set<Service> _selectedServices = {};
  bool _existImage = false;

  @override
  void initState() {
    context.read<ServicesBloc>().add(ServicesEvent.load());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ImageCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: BlocListener<DogSitterBloc, DogSitterState>(
              listener: (context, state) {
                state.map(
                  initial: (_) {},
                  loading: (_) {},
                  loaded: (state) {
                    CustomSnackBar.showSuccess(context, AppString.loginSuccess);
                    context.goNamed(RoutesNames.todo, extra: state.dogsitter);
                  },
                  failure: (state) {
                    CustomSnackBar.showError(context, state.message);
                  },
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarDogSitter(existImage: () {
                    setState(() {
                      _existImage = true;
                    });
                  }),
                  const SizedBox(
                    height: 10.0,
                  ),
                  PositionsList(
                    selectedServices: _selectedServices,
                    onChanged: (value, isSelected) {
                      setState(() {
                        isSelected
                            ? _selectedServices.add(value)
                            : _selectedServices.remove(value);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RoundedElevatedButton(
                    onPressed: () {
                      if (_existImage && _selectedServices.isNotEmpty) {
                        context.read<DogSitterBloc>().add(
                            DogSitterEvent.selectPositions(
                                selectedServices: _selectedServices));
                        context.goNamed(RoutesNames.todo);
                      }
                    },
                    widget: BlocBuilder<DogSitterBloc, DogSitterState>(
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
      ),
    );
  }
}
