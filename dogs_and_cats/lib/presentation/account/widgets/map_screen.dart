import 'package:dogs_and_cats/presentation/account/blocs/map_search_bloc/map_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../domain/models/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController _mapController;
  var _mapZoom = 0.0;
  late CameraPosition _center;

  @override
  void initState() {
    final MoscowLocation moscow = MoscowLocation();
    _center = CameraPosition(
        target: Point(latitude: moscow.lat, longitude: moscow.long));
    super.initState();
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
                  _mapController.moveCamera(
                    CameraUpdate.newCameraPosition(
                      _center.copyWith(zoom: 12.0),
                    ),
                  );
                  final region = await _mapController.getVisibleRegion();
                  context
                      .read<MapSearchBloc>()
                      .add(MapSearchEvent.regionChanged(region: region));
                },
                onCameraPositionChanged:
                    (cameraPosition, reason, finished) async {
                  setState(() {
                    _mapZoom = cameraPosition.zoom;
                    _center = cameraPosition;
                  });
                  final region = await _mapController.getVisibleRegion();
                  context
                      .read<MapSearchBloc>()
                      .add(MapSearchEvent.regionChanged(region: region));
                },
              ),
              Icon(
                Icons.location_on,
                size: 35.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
        Text('${_center.target.longitude} ${_center.target.latitude}')
      ],
    );
  }
}
