import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:dogs_and_cats/domain/models/location.dart';
import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../presentation/account/blocs/map_search_bloc/map_search_bloc.dart';
import '../theme/theme.dart';

class ButtonAddress extends StatefulWidget {
  const ButtonAddress({
    super.key,
    required this.person,
    required this.widget,
  });
  final Person person;
  final Widget widget;

  @override
  State<ButtonAddress> createState() => _ButtonAddressState();
}

class _ButtonAddressState extends State<ButtonAddress> {
  late AppLatLong appLatLong;

  @override
  void initState() {
    appLatLong =
        AppLatLong(lat: widget.person.latitude, long: widget.person.longitude);
    if (appLatLong.lat != null) {
      context.read<MapSearchBloc>().add(
            MapSearchEvent.pointChanged(
              point:
                  Point(latitude: appLatLong.lat!, longitude: appLatLong.long!),
            ),
          );
      context.read<MapSearchBloc>().add(MapSearchEvent.getSearchResult());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RoundedElevatedButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          builder: (newContext) {
            return widget.widget;
          },
        );
      },
      widget: BlocBuilder<MapSearchBloc, MapSearchState>(
        builder: (context, state) {
          return state.map(
            loading: (_) => const Text('Адрес не задан'),
            success: (state) => Text(
              state.results.first.title,
              style: textTheme.bodyMedium,
            ),
            selectedObjectBySearching: (_) => Container(),
            failure: (failure) => Text(
              failure.message,
              style: textTheme.bodyMedium,
            ),
          );
        },
      ),
    );
  }
}
