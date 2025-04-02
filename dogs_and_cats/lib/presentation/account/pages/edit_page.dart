import 'package:dogs_and_cats/presentation/account/widgets/custom_profile_button.dart';
import 'package:dogs_and_cats/presentation/account/widgets/email_edit.dart';
import 'package:dogs_and_cats/presentation/account/widgets/name_edit.dart';
import 'package:dogs_and_cats/presentation/account/widgets/phone_edit.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/person.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.person});
  final Person person;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  void _showEditBottomSheet(BuildContext context, Widget page) {
    Navigator.pop(context);

    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: false,
      isScrollControlled: true,
      builder: (context) {
        return page;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          CustomProfileButton(
            mainInfoTitle:
                '${widget.person.firstName} ${widget.person.lastName}',
            icon: Icons.person,
            onPressed: () {
              _showEditBottomSheet(
                context,
                NameEdit(person: widget.person),
              );
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomProfileButton(
            mainInfoTitle: '${widget.person.phone}',
            icon: Icons.person,
            onPressed: () {
              _showEditBottomSheet(
                context,
                PhoneEdit(person: widget.person),
              );
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomProfileButton(
            mainInfoTitle: '${widget.person.email}',
            icon: Icons.person,
            onPressed: () {
              _showEditBottomSheet(
                context,
                EmailEdit(
                  person: widget.person,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
