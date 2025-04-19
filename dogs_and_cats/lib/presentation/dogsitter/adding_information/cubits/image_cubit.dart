import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dogs_and_cats/domain/repositories/dog_sitter_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_cubit.freezed.dart';
part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  DogSitterRepository repository;
  ImageCubit({required this.repository}) : super(const ImageState.loading());

  Future<void> addImage({required Uint8List imageBytes}) async {
    final result = await repository.addImage(imageBytes: imageBytes);

    result.fold((failure) => emit(ImageState.failure(message: failure.message)),
        (_) async => await getImageUrl());
  }

  Future<void> getImageUrl() async {
    final result = await repository.getImageUrl();

    result.fold((failure) => emit(ImageState.failure(message: failure.message)),
        (imageUrl) => emit(ImageState.loaded(imageUrl: imageUrl)));
  }
}
