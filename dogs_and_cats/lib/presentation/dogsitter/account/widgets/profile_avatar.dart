import 'package:dogs_and_cats/domain/models/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../adding_information/cubits/image_cubit.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({
    super.key,
    required this.person,
  });
  final Person person;

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  void initState() {
    context.read<ImageCubit>().getImageUrlById(id: widget.person.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        return state.map(
          loading: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (state) => CircleAvatar(
            radius: 75,
            backgroundImage: NetworkImage(
              state.imageUrl,
            ),
          ),
          failure: (state) => Center(
            child: Text(state.message),
          ),
        );
      },
    );
  }
}
