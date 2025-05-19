import 'package:dogs_and_cats/presentation/account/blocs/map_search_bloc/map_search_bloc.dart';
import 'package:dogs_and_cats/presentation/account/cubits/map_location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../domain/models/location.dart';
import '../../../domain/models/person.dart';
import '../blocs/map_suggest_bloc/map_suggest_bloc.dart';
import '../widgets/near_me_outlined.dart';
import '../widgets/show_result_search.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.person});
  final Person person;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  YandexMapController? _mapController;
  late CameraPosition _location;

  @override
  void initState() {
    _initMap(lat: widget.person.latitude, long: widget.person.longitude);
    context.read<MapLocationCubit>().initializeMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                YandexMap(
                  nightModeEnabled:
                      Theme.of(context).brightness == Brightness.light
                          ? false
                          : true,
                  onMapCreated: (controller) async {
                    _mapController = controller;
                    await _mapController!
                        .moveCamera(CameraUpdate.newCameraPosition(_location));
                    await _updateVisibleRegion();
                  },
                  onCameraPositionChanged:
                      (cameraPosition, reason, finished) async {
                    if (finished) {
                      context.read<MapSearchBloc>().add(
                          MapSearchEvent.pointChanged(
                              point: cameraPosition.target));
                      context
                          .read<MapSearchBloc>()
                          .add(MapSearchEvent.getSearchResult());
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
                  child: BlocBuilder<MapLocationCubit, MapLocationState>(
                    builder: (context, state) {
                      return state.map(loading: (_) {
                        return Container();
                      }, loaded: (state) {
                        return GestureDetector(
                          onTap: () {
                            final currentLocation = state.location;
                            _moveCameraPosition(currentLocation);
                          },
                          child: NearMeOutlined(),
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          ShowResultSearch(
            mapController: _mapController,
            person: widget.person,
          ),
        ],
      ),
    );
  }

  void _initMap({double? lat, double? long}) {
    AppLatLong appLatLong;
    if (lat == null || long == null) {
      appLatLong = MoscowLocation();
    } else {
      appLatLong = AppLatLong(lat: lat, long: long);
    }
    _location = CameraPosition(
        target: Point(latitude: appLatLong.lat, longitude: appLatLong.long));
  }

  Future<void> _moveCameraPosition(AppLatLong currentLocation) async {
    final position = CameraPosition(
      target: Point(
        latitude: currentLocation.lat,
        longitude: currentLocation.long,
      ),
      zoom: 18.0,
    );
    await _mapController!.moveCamera(CameraUpdate.newCameraPosition(position));
  }

  Future<void> _updateVisibleRegion() async {
    if (!mounted) return;
    final region = await _mapController!.getVisibleRegion();
    context.read<MapSuggestBloc>().add(
          MapSuggestEvent.regionChanged(region: region),
        );
  }
}
