part of 'services_bloc.dart';

@freezed
class ServicesEvent with _$ServicesEvent {
  const factory ServicesEvent.load() = _Load;
  const factory ServicesEvent.loadById({required String serviceId}) = _LoadById;
}
