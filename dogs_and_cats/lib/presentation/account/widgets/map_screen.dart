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
  CameraPosition? _userLocation;
  late CameraPosition _location;

  @override
  void initState() {
    super.initState();
    final MoscowLocation moscow = MoscowLocation();
    _location = CameraPosition(
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
                  final region = await _mapController.getVisibleRegion();
                  changeRegion(region);
                  context
                      .read<MapControllerCubit>()
                      .setMapController(_mapController);
                },
                onCameraPositionChanged:
                    (cameraPosition, reason, finished) async {
                  setState(
                    () {
                      _mapZoom = cameraPosition.zoom;
                      _location = cameraPosition;
                    },
                  );
                  final region = await _mapController.getVisibleRegion();
                  changeRegion(region);
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
                    if (_userLocation != null) {
                      _mapController.moveCamera(
                          CameraUpdate.newCameraPosition(_userLocation!));
                    }
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
          '${_location.target.longitude} ${_location.target.latitude}',
        )
      ],
    );
  }

  Future<void> regionChanged() async {}

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
    _userLocation = CameraPosition(target: point, zoom: 18);
    _mapController.moveCamera(
      animation:
          const MapAnimation(type: MapAnimationType.linear, duration: 0.1),
      CameraUpdate.newCameraPosition(_userLocation!),
    );
  }

  void changeRegion(VisibleRegion region) {
    if (!mounted) return;
    context
        .read<MapSearchBloc>()
        .add(MapSearchEvent.regionChanged(region: region));
  }
}
