import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc.dart';
import 'package:dogs_and_cats/presentation/services/ordering_service_bloc/ordering_service_bloc.dart';
import 'package:dogs_and_cats/presentation/services/service_bloc/services_bloc.dart';
import 'package:dogs_and_cats/presentation/services/widgets/custom_service_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Услуги'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ServicesBloc, ServicesState>(
                    builder: (context, state) {
                  return state.map(
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
                                  CustomServiceButton(
                                      onPressed: () {
                                        context.replaceNamed(
                                          RoutesNames.orderingService,
                                        );
                                        context.read<OrderingServiceBloc>().add(
                                            OrderingServiceEvent
                                                .loadTimeAndCostOfService(
                                                    id: state
                                                        .service[index].id));
                                        context
                                            .read<PetBloc>()
                                            .add(PetEvent.load());
                                      },
                                      nameService: state.service[index].title,
                                      description:
                                          state.service[index].description)
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
