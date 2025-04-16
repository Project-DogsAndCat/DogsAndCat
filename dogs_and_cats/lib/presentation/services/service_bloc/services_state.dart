part of 'services_bloc.dart';

@freezed
class ServicesState with _$ServicesState {
  const factory ServicesState.loading() = _Loading;
  const factory ServicesState.loaded({
    required List<Service> service,
  }) = _loaded;
  const factory ServicesState.loadedService({
    required Service service,
  }) = _LoadedService;
  const factory ServicesState.failure({
    required String message,
  }) = _Failure;
}
