part of 'disrtibution_bloc.dart';

@freezed
class DistributionState with _$DistributionState {
  const factory DistributionState.loading() = _Loading;

  const factory DistributionState.loaded({
    required List<TaskModel> tasks,
  }) = _Loaded;

  const factory DistributionState.failure({
    required String message,
  }) = _Failure;
}
