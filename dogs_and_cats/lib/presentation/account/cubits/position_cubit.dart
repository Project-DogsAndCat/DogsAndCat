import 'package:bloc/bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'position_state.dart';

class MapControllerCubit extends Cubit<MapControllerState> {
  MapControllerCubit() : super(MapControllerState());

  void setMapController(YandexMapController mapController) {
    emit(MapControllerState(mapController: mapController));
  }
}
