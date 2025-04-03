import 'package:dogs_and_cats/presentation/account/cubits/position_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../core/widgets/custom_text_form_field.dart';
import '../blocs/map_search_bloc/map_search_bloc.dart';
import '../widgets/map_screen.dart';

class MapSearchPage extends StatefulWidget {
  const MapSearchPage({super.key});

  @override
  State<MapSearchPage> createState() => _MapSearchPageState();
}

class _MapSearchPageState extends State<MapSearchPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Отменить'),
          ),
        ),
        const Center(
          child: SizedBox(
            height: 350,
            width: double.infinity,
            child: MapScreen(),
          ),
        ),
        CustomTextFormField(
          onChanged: (text) {
            context
                .read<MapSearchBloc>()
                .add(MapSearchEvent.queryChanged(query: text));
          },
          controller: controller,
          hintText: 'Адрес',
        ),
        ElevatedButton(
          onPressed: () {
            context.read<MapSearchBloc>().add(MapSearchEvent.getSearchResult());
          },
          child: const Text('Поиск'),
        ),
        BlocBuilder<MapSearchBloc, MapSearchState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => Container(),
              loading: (_) => Center(
                child: CircularProgressIndicator(),
              ),
              success: (results) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 200,
                  ),
                  child: ListView.builder(
                    itemCount: results.results.length,
                    itemBuilder: (context, index) {
                      return BlocBuilder<MapControllerCubit,
                          MapControllerState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              state.mapController!.moveCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                          target: Point(
                                              latitude: results.results[index]
                                                  .point!.latitude,
                                              longitude: results.results[index]
                                                  .point!.longitude))
                                      .copyWith(zoom: 18.0),
                                ),
                              );
                            },
                            child: ListTile(
                              title: Text(results.results[index].title),
                              subtitle: Text(
                                results.results[index].point.toString(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
              failure: (message) => Text(message.message),
            );
          },
        ),
      ],
    );
  }
}
