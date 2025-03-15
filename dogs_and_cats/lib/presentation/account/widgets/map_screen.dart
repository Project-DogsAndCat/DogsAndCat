import 'dart:async';

import 'package:dogs_and_cats/data/repositories/location_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../domain/models/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController mapControllerCompleter;
  var _mapZoom = 0.0;
  late CameraPosition _userLocation;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: YandexMap(
        onMapCreated: (controller) {
          mapControllerCompleter = controller;
          _initPermission();
        },
        onCameraPositionChanged: (cameraPosition, _, __) {
          setState(() {
            _mapZoom = cameraPosition.zoom;
          });
        },
        onUserLocationAdded: (view) async {
          await _fetchCurrentLocation();
          await mapControllerCompleter.moveCamera(
            CameraUpdate.newCameraPosition(
              _userLocation.copyWith(zoom: 15),
            ),
            animation: const MapAnimation(
              type: MapAnimationType.linear,
              duration: 0.3,
            ),
          );
          return view.copyWith(
            pin: view.pin.copyWith(
              opacity: 1,
            ),
          );
        },
      ),
    );
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = MoscowLocation();
    try {
      location = await LocationRepositoryImpl().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    _userLocation = CameraPosition(
        target: Point(latitude: location.lat, longitude: location.long));
    await mapControllerCompleter.toggleUserLayer(visible: true);
  }

  Future<void> _initPermission() async {
    if (!await LocationRepositoryImpl().checkPermission()) {
      await LocationRepositoryImpl().requestPermission();
    }
    await _fetchCurrentLocation();
  }
}
