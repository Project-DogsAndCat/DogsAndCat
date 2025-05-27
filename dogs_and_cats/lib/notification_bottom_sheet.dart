import 'package:dogs_and_cats/core/widgets/rounded_elevated_button.dart';
import 'package:dogs_and_cats/presentation/dogsitter/adding_information/cubits/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_colors.dart';
import 'core/theme/theme.dart';

class NotificationBottomSheet extends StatefulWidget {
  const NotificationBottomSheet({
    super.key,
    required this.message,
  });

  final Map<String, dynamic> message;

  @override
  State<NotificationBottomSheet> createState() =>
      _NotificationBottomSheetState();
}

class _NotificationBottomSheetState extends State<NotificationBottomSheet> {
  @override
  void initState() {
    context.read<ImageCubit>().getImageUrlById(id: widget.message['id']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 15.0,
            ),
            BlocBuilder<ImageCubit, ImageState>(
              builder: (context, state) {
                return state.map(
                  loading: (_) => Container(),
                  loaded: (state) => CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(
                      state.imageUrl,
                    ),
                  ),
                  failure: (state) => Text(
                    state.message,
                    style: textTheme.bodyLarge,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(widget.message['name'], style: textTheme.bodyLarge),
            const SizedBox(
              height: 10.0,
            ),
            Text(widget.message['price'].toString(),
                style: textTheme.bodyLarge),
            const SizedBox(
              height: 10.0,
            ),
            Text(widget.message['serviceTitle'], style: textTheme.bodyLarge),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 100,
              child: RoundedElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                widget: Text(
                  "Понятно",
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
