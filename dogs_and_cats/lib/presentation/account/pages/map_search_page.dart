import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../blocs/map_search_bloc/map_search_bloc.dart';
import '../blocs/map_suggest_bloc/map_suggest_bloc.dart';

class MapSearchPage extends StatefulWidget {
  const MapSearchPage({super.key, this.mapController});
  final YandexMapController? mapController;

  @override
  State<MapSearchPage> createState() => _MapSearchPageState();
}

class _MapSearchPageState extends State<MapSearchPage> {
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          CustomTextFormField(
            onChanged: (text) {
              context
                  .read<MapSuggestBloc>()
                  .add(MapSuggestEvent.queryChanged(query: text));
            },
            controller: addressController,
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
                            context.read<MapSearchBloc>().add(
                                MapSearchEvent.setSelectObject(
                                    item: results.results[index]));

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
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            title: Text(results.results[index].title),
                            subtitle: Text(
                              results.results[index].displayText.toString(),
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
      ),
    );
  }
}
