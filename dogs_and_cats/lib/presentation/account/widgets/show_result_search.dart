import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:dogs_and_cats/presentation/account/blocs/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../blocs/map_search_bloc/map_search_bloc.dart';
import '../pages/map_search_page.dart';

class ShowResultSearch extends StatefulWidget {
  const ShowResultSearch({
    super.key,
    required this.mapController,
    required this.person,
  });
  final YandexMapController? mapController;
  final Person person;

  @override
  State<ShowResultSearch> createState() => _ShowResultSearchState();
}

class _ShowResultSearchState extends State<ShowResultSearch> {
  Person? updatePerson;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (newContext) {
                  return MapSearchPage(
                    mapController: widget.mapController,
                  );
                },
              );
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<MapSearchBloc, MapSearchState>(
                    builder: (context, state) {
                      return state.map(
                        loading: (_) => const Text(''),
                        success: (state) {
                          updatePerson = widget.person.copyWith(
                            latitude: state.results.first.point!.latitude,
                            longitude: state.results.first.point!.longitude,
                          );
                          return Text(
                            state.results.first.title,
                            style: Theme.of(context).textTheme.bodyMedium,
                          );
                        },
                        selectedObjectBySearching: (state) {
                          updatePerson = widget.person.copyWith(
                            latitude: state.selectedObject.point!.latitude,
                            longitude: state.selectedObject.point!.longitude,
                          );
                          return Text(
                            state.selectedObject.title,
                            style: Theme.of(context).textTheme.bodyMedium,
                          );
                        },
                        failure: (failure) => Text(
                          failure.message,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    },
                  ),
                  const Icon(Icons.search),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          RoundedElevatedButton(
            onPressed: () {
              if (updatePerson != null) {
                context.read<ProfileBloc>().add(ProfileEvent.edit(
                      originalPerson: widget.person,
                      updatePerson: updatePerson!,
                    ));
              }
            },
            widget: const Text(AppString.save),
          ),
        ],
      ),
    );
  }
}
