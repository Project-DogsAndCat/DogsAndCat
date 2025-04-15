import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/core/theme/theme.dart';
import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc.dart';
import 'package:dogs_and_cats/presentation/services/ordering_service_bloc/ordering_service_bloc.dart';
import 'package:dogs_and_cats/presentation/services/service_bloc/services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Выберите\nжелаемую\nуслугу',
                style: textTheme.titleLarge,
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: BlocBuilder<ServicesBloc, ServicesState>(
                    builder: (context, state) {
                  return state.map(
                      loadedService: (_) {
                        return Container();
                      },
                      loading: (_) => Center(
                            child: CircularProgressIndicator(
                              color: Colors.blueAccent,
                            ),
                          ),
                      loaded: (state) {
                        return ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  RoundedElevatedButton(
                                    onPressed: () {
                                      context.replaceNamed(
                                          RoutesNames.orderingService);
                                      context.read<OrderingServiceBloc>().add(
                                              OrderingServiceEvent
                                                  .loadTimeAndCostOfService(
                                            id: state.service[index].id,
                                            titleService:
                                                state.service[index].title,
                                          ));
                                      context
                                          .read<PetBloc>()
                                          .add(PetEvent.load());
                                    },
                                    color: AppColors.buttonServiceColor,
                                    height: 100,
                                    widget: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(7),
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: AppColors.whiteColor),
                                          child: SvgPicture.asset(
                                            state.service[index].image,
                                            // width: 40,
                                            // height: 40,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.service[index].title,
                                                style: textTheme.labelMedium,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                state
                                                    .service[index].description,
                                                style: textTheme.bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: state.service.length);
                      },
                      failure: (state) => Text(state.message));
                }),
              )
            ],
          ),
        ));
  }
}
