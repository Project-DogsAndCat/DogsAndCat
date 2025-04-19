part of 'information_dog_sitter_bloc.dart';

@freezed
class InformationDogSitterEvent with _$InformationDogSitterEvent {
  const factory InformationDogSitterEvent.load() = _Load;
  const factory InformationDogSitterEvent.addInformation({
    required String position,
  }) = _AddInformation;
  const factory InformationDogSitterEvent.addImage({
    required Uint8List imageBytes,
  }) = _AddImage;
}
