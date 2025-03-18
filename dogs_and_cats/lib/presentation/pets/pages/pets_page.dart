import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';
import '../widgets/list_pets.dart';
import 'add_pet_page.dart';

class PetsPage extends StatelessWidget {
  const PetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.goNamed(RoutesNames.account);
          },
        ),
        title: Text(AppString.myPets),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: CustomScrollView(
          slivers: [
            ListPets(),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (newContext) {
                        return AddPetPage();
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text('Добавить питомца'),
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
