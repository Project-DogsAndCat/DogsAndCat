import 'package:dogs_and_cats/presentation/account/cubits/map_location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../core/utils/app_strings.dart';
import '../../../domain/models/location.dart';
import '../blocs/map_suggest_bloc/map_suggest_bloc.dart';
import 'map_search_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  YandexMapController? _mapController;
  late CameraPosition _userLocation;
  CameraPosition _location = CameraPosition(
    target: Point(
      latitude: MoscowLocation().lat,
      longitude: MoscowLocation().long,
    ),
  );

  @override
  void initState() {
    context.read<MapLocationCubit>().initializeMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(AppString.cancel),
          ),
        ),
        SizedBox(
          height: 350,
          width: double.infinity,
          child: BlocBuilder<MapLocationCubit, MapLocationState>(
              builder: (context, state) {
            return state.map(
                loading: (_) => Center(
                      child: CircularProgressIndicator(),
                    ),
                loaded: (state) {
                  return Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      YandexMap(
                        onMapCreated: (controller) async {
                          _mapController = controller;
                          final currentLocation = state.location;
                          _userLocation = CameraPosition(
                            target: Point(
                              latitude: currentLocation.lat,
                              longitude: currentLocation.long,
                            ),
                          );
                          await _mapController!.moveCamera(
                              CameraUpdate.newCameraPosition(_userLocation));
                          await _updateVisibleRegion();
                        },
                        onCameraPositionChanged:
                            (cameraPosition, reason, finished) async {
                          if (finished) {
                            setState(() {
                              _location = cameraPosition;
                            });
                            await _updateVisibleRegion();
                          }
                        },
                      ),
                      const Icon(
                        Icons.location_on,
                        size: 35.0,
                        color: Colors.red,
                      ),
                      Align(
                        alignment: const Alignment(-0.95, 0.95),
                        child: GestureDetector(
                          onTap: () {
                            if (_mapController != null) {
                              _mapController!.moveCamera(
                                  CameraUpdate.newCameraPosition(
                                      _userLocation));
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color(0xFF000000).withAlpha(60),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.0,
                                    offset: const Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: const Icon(
                                Icons.near_me_outlined,
                                color: Colors.black,
                                size: 35.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }),
        ),
        // Text(
        //   '${_location.target.longitude} ${_location.target.latitude}',
        // ),
        MapSearchPage(
          mapController: _mapController,
        ),
      ],
    );
  }

  Future<void> _updateVisibleRegion() async {
    if (!mounted) return;
    final region = await _mapController!.getVisibleRegion();
    context.read<MapSuggestBloc>().add(
          MapSuggestEvent.regionChanged(region: region),
        );
  }
}
