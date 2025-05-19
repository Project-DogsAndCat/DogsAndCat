import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/theme.dart';
import '../widgets/list_pets.dart';
import 'add_pet_page.dart';

class PetsPage extends StatelessWidget {
  const PetsPage({super.key, required this.backPage});
  final String backPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.replaceNamed(backPage);
          },
        ),
        title: Text(
          AppString.myPets,
          style: textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          slivers: [
            ListPets(),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => AddPetPage(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.add),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Text(AppString.addPet),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
