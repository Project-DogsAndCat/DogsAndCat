import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/core/routes/routes.dart';
import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/presentation/pets/pages/add_pet_page.dart';
import 'package:dogs_and_cats/presentation/services/ordering_service_bloc/ordering_service_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../core/utils/app_strings.dart';
import '../../pets/blocs/pet_bloc.dart';
import '../widgets/pet_selection_widget.dart';

class OrderingServicePage extends StatefulWidget {
  const OrderingServicePage({super.key});

  @override
  State<OrderingServicePage> createState() => _OrderingServiceState();
}

class _OrderingServiceState extends State<OrderingServicePage> {
  _OrderingServiceState();

  int? _selectedValue = 0;
  late String _time;
  late String _price;
  late String _idPet;
  late DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("ru_RU");
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ услуги'),
        leading: BackButton(
          onPressed: () {
            context.replaceNamed(RoutesNames.services);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            BlocBuilder<OrderingServiceBloc, OrderingServiceState>(
                builder: (context, state) {
              return state.map(
                loaded: (value) => Wrap(
                  spacing: 5.0,
                  children:
                      List.generate(value.characteristics.length, (int index) {
                    return ChoiceChip(
                      label: Column(
                        children: [
                          Text(value.characteristics[index].time),
                          Text(
                              '${value.characteristics[index].price.toStringAsFixed(0)} руб')
                        ],
                      ),
                      selected: _selectedValue == index,
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedValue = selected ? index : null;
                          _time = value.characteristics[index].time;
                          _price = value.characteristics[index].price
                              .toStringAsFixed(0);
                        });
                      },
                      showCheckmark: false,
                      selectedColor: AppColors.primaryColor,
                    );
                  }).toList(),
                ),
                loading: (_) => Center(child: CircularProgressIndicator()),
                failure: (state) => Text(state.message),
                success: (_) => Container(),
              );
            }),
            SizedBox(
              height: 20,
            ),
            Text(DateFormat.MMMMEEEEd("ru_RU").format(_selectedDate)),
            SizedBox(
              height: 10,
            ),
            DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              daysCount: 15,
              locale: "ru_RU",
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColors.primaryColor,
              selectedTextColor: AppColors.whiteColor,
              dateTextStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              dayTextStyle:
                  TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
              monthTextStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              onDateChange: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text('Для какого питомца?'),
            PetSelectionWidget(
              onSelected: (int? selectedIndex, String petId) {
                setState(() {
                  _idPet = petId;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                router.goNamed(RoutesNames.pets,
                    pathParameters: {'backPage': RoutesNames.orderingService});
              },
              child: Text(
                'Добавить питомца',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
