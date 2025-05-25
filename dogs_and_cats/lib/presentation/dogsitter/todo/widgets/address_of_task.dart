import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../domain/models/location.dart';
import '../../../account/widgets/near_me_outlined.dart';

class AddressOfTask extends StatefulWidget {
  const AddressOfTask({
    super.key,
    required this.appLatLong,
  });
  final AppLatLong appLatLong;

  @override
  State<AddressOfTask> createState() => _AddressOfTaskState();
}

class _AddressOfTaskState extends State<AddressOfTask> {
  late YandexMapController _mapController;
  late CameraPosition _location;

  @override
  void initState() {
    _initMap(widget.appLatLong.lat!, widget.appLatLong.long!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text('Закрыть'),
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
                  onMapCreated: (controller) async {
                    _mapController = controller;
                    await _mapController
                        .moveCamera(CameraUpdate.newCameraPosition(_location));
                  },
                  nightModeEnabled:
                      Theme.of(context).brightness == Brightness.light
                          ? false
                          : true,
                ),
                const Icon(
                  Icons.location_history_rounded,
                  size: 35.0,
                  color: Colors.red,
                ),
                Align(
                  alignment: const Alignment(-0.95, 0.95),
                  child: GestureDetector(
                    onTap: () {
                      _moveCameraPosition(
                          widget.appLatLong.lat!, widget.appLatLong.long!);
                    },
                    child: IconLocationMap(
                      icon: Icons.location_history,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _initMap(double lat, double long) {
    AppLatLong location = AppLatLong(lat: lat, long: long);

    _location = CameraPosition(
      target: Point(latitude: location.lat!, longitude: location.long!),
    );
  }

  Future<void> _moveCameraPosition(double lat, double long) async {
    final position = CameraPosition(
      target: Point(
        latitude: lat,
        longitude: long,
      ),
      zoom: 15.0,
    );
    await _mapController.moveCamera(CameraUpdate.newCameraPosition(position));
  }
}
