import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../core/widgets/custom_text_form_field.dart';
import '../blocs/map_suggest_bloc/map_suggest_bloc.dart';

class MapSearchPage extends StatefulWidget {
  const MapSearchPage({super.key, required this.mapController});
  final YandexMapController? mapController;

  @override
  State<MapSearchPage> createState() => _MapSearchPageState();
}

class _MapSearchPageState extends State<MapSearchPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextFormField(
          onChanged: (text) {
            context
                .read<MapSuggestBloc>()
                .add(MapSuggestEvent.queryChanged(query: text));
          },
          controller: controller,
          hintText: AppString.address,
        ),
        ElevatedButton(
          onPressed: () {
            context
                .read<MapSuggestBloc>()
                .add(MapSuggestEvent.getSuggestResult());
          },
          child: const Text(AppString.search),
        ),
        BlocBuilder<MapSuggestBloc, MapSuggestState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => Container(),
              loading: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              success: (results) {
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: results.results.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (widget.mapController != null) {
                            widget.mapController!.moveCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: Point(
                                      latitude: results
                                          .results[index].point!.latitude,
                                      longitude: results
                                          .results[index].point!.longitude),
                                ).copyWith(zoom: 18.0),
                              ),
                            );
                          }
                        },
                        child: ListTile(
                          title: Text(results.results[index].title),
                          subtitle: Text(
                            results.results[index].point.toString(),
                          ),
                        ),
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
