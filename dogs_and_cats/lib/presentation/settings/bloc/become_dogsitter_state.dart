part of 'become_dogsitter_cubit.dart';

@freezed
class BecomeDogsitterState with _$BecomeDogsitterState {
  const factory BecomeDogsitterState.initial() = _Initial;

  const factory BecomeDogsitterState.loading() = _Loading;

  const factory BecomeDogsitterState.success() = _Success;

  const factory BecomeDogsitterState.failure({
    required String message,
  }) = _Failure;
}
