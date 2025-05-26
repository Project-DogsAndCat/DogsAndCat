import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/presentation/pets/blocs/pet_bloc/pet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/theme.dart';
import '../widgets/list_pets.dart';
import 'add_pet_page.dart';

class PetsPage extends StatefulWidget {
  const PetsPage({
    super.key,
    required this.backPage,
  });
  final String backPage;

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  @override
  void initState() {
    context.read<PetBloc>().add(PetEvent.load());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pop(widget.backPage);
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
                    builder: (context) => const AddPetPage(),
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
