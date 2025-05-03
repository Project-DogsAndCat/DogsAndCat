part of 'dog_sitter_bloc.dart';

@freezed
class DogSitterEvent with _$DogSitterEvent {
  const factory DogSitterEvent.load() = _Load;

  const factory DogSitterEvent.selectPositions({
    required Set<Service> selectedServices,
  }) = _SelectPositions;

  const factory DogSitterEvent.updateStatus({
    required StatusDogSitter currentStatus,
  }) = _UpdateStatus;

  const factory DogSitterEvent.addImage({
    required Uint8List imageBytes,
  }) = _AddImage;
}
