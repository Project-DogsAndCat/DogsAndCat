import 'package:dogs_and_cats/data/repositories/location_reposory_impl.dart';
import 'package:dogs_and_cats/domain/models/location.dart';
import 'package:dogs_and_cats/presentation/account/blocs/map_search_bloc/map_search_bloc.dart';
import 'package:dogs_and_cats/presentation/account/cubits/position_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController _mapController;
  var _mapZoom = 0.0;
  late CameraPosition _userLocation;

  @override
  void initState() {
    super.initState();
    final MoscowLocation moscow = MoscowLocation();
    _userLocation = CameraPosition(
        target: Point(latitude: moscow.lat, longitude: moscow.long));
    _initPermission().ignore();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              YandexMap(
                onMapCreated: (controller) async {
                  _mapController = controller;
                  context
                      .read<MapControllerCubit>()
                      .setMapController(_mapController);
                  await regionChanged();
                },
                onCameraPositionChanged:
                    (cameraPosition, reason, finished) async {
                  setState(
                    () {
                      _mapZoom = cameraPosition.zoom;
                      _userLocation = cameraPosition;
                    },
                  );
                  await regionChanged();
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
                    _fetchCurrentLocation();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF000000).withAlpha(60),
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
          ),
        ),
        Text(
          '${_userLocation.target.longitude} ${_userLocation.target.latitude}',
        )
      ],
    );
  }

  Future<void> regionChanged() async {
    final region = await _mapController.getVisibleRegion();
    if (mounted) return;
    context
        .read<MapSearchBloc>()
        .add(MapSearchEvent.regionChanged(region: region));
  }

  Future<void> _initPermission() async {
    if (!await LocationRepositoryImpl().checkPermission()) {
      await LocationRepositoryImpl().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await LocationRepositoryImpl().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(location);
  }

  void _moveToCurrentLocation(
    AppLatLong appLatLong,
  ) {
    Point point = Point(
      latitude: appLatLong.lat,
      longitude: appLatLong.long,
    );
    _userLocation = CameraPosition(target: point);
    _mapController.moveCamera(
      animation:
          const MapAnimation(type: MapAnimationType.linear, duration: 0.1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: point,
          zoom: 18,
        ),
      ),
    );
  }
}
