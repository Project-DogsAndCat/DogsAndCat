import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../cubits/image_cubit.dart';

class AvatarDogSitter extends StatefulWidget {
  const AvatarDogSitter({
    super.key,
    required this.existImage,
  });

  final Function() existImage;
  @override
  State<AvatarDogSitter> createState() => _AvatarDogSitterState();
}

class _AvatarDogSitterState extends State<AvatarDogSitter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: BlocBuilder<ImageCubit, ImageState>(
            builder: (context, state) {
              return state.map(
                loading: (_) => CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 75,
                ),
                loaded: (state) => CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(
                    state.imageUrl,
                  ),
                ),
                failure: (state) => Center(
                  child: Text(
                    state.message,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        RoundedElevatedButton(
          widget: Text(AppString.addImage),
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            if (image == null) return;

            final imageByBytes = await image.readAsBytes();

            widget.existImage();
            if (mounted) {
              context.read<ImageCubit>().addImage(imageBytes: imageByBytes);
            }
          },
        ),
      ],
    );
  }
}
