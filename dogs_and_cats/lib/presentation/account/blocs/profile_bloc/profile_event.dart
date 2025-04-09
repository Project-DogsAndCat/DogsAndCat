part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.load() = _Load;
  const factory ProfileEvent.edit({
    required Person originalPerson,
    required Person updatePerson,
  }) = _Edit;
  const factory ProfileEvent.editEmail({
    required String email,
  }) = _EditEmail;
}
