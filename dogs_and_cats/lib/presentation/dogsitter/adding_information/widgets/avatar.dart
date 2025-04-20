import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../cubits/image_cubit.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    super.key,
    required this.existImage,
  });

  final Function() existImage;
  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ImageCubit, ImageState>(
          builder: (context, state) {
            return state.map(
              loading: (_) =>
                  Container(height: 150.0, width: 150.0, color: Colors.green),
              loaded: (state) => SizedBox(
                width: 150.0,
                height: 150.0,
                child: Image.network(
                  state.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              failure: (state) => Center(
                child: Text(state.message),
              ),
            );
          },
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
            if (image == null) {
              return;
            }
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
