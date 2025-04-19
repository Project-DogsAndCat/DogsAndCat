part of 'image_cubit.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState.loading() = _Loading;
  const factory ImageState.loaded({required String imageUrl}) = _Loaded;
  const factory ImageState.failure({required String message}) = _Failure;
}
