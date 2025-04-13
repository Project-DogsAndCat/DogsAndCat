import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/presentation/auth/widgets/custom_snackbar.dart';
import 'package:dogs_and_cats/presentation/services/ordering_service_bloc/ordering_service_bloc.dart';
import 'package:dogs_and_cats/presentation/services/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../core/widgets/rounded_elevated_button.dart';
import '../widgets/pet_selection_widget.dart';

class OrderingServicePage extends StatefulWidget {
  const OrderingServicePage({
    super.key,
  });

  @override
  State<OrderingServicePage> createState() => _OrderingServiceState();
}

class _OrderingServiceState extends State<OrderingServicePage> {
  _OrderingServiceState();

  int? _selectedValue;

  late String idService;
  late String titleService;
  String? duration;
  double? price;
  late DateTime date = DateTime.now();
  String? time;
  List<String>? petIds;

  String? namePet;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("ru_RU");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заказ услуги'),
        leading: BackButton(
          onPressed: () {
            context.replaceNamed(RoutesNames.services);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              BlocBuilder<OrderingServiceBloc, OrderingServiceState>(
                  builder: (context, state) {
                return state.map(
                  loaded: (value) {
                    idService = value.idService;
                    titleService = value.titleService;
                    return Wrap(
                      spacing: 5.0,
                      children: List.generate(value.characteristics.length,
                          (int index) {
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
                              _selectedValue = index;
                              duration = value.characteristics[index].time;
                              price = value.characteristics[index].price;
                            });
                          },
                          showCheckmark: false,
                          selectedColor: AppColors.primaryColor,
                        );
                      }).toList(),
                    );
                  },
                  loading: (_) => Center(child: CircularProgressIndicator()),
                  failure: (state) => Text(state.message),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Text(
                  '${DateFormat.MMMMEEEEd("ru_RU").format(date)}, ${time ?? ''}'),
              const SizedBox(
                height: 10,
              ),
              DatePickerWidget(
                height: 100,
                width: 80,
                daysCount: 15,
                onDateChange: (date) {
                  setState(() {
                    date = date;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedElevatedButton(
                onPressed: () => _showTimePicker(),
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Выберите время',
                    ),
                    Text(
                      time ?? '',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Для какого питомца?'),
              PetSelectionWidget(
                onSelected: (List<String> ids, List<String> names) {
                  setState(() {
                    petIds = ids;
                    namePet = names.toString();
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  context.goNamed(RoutesNames.pets, pathParameters: {
                    'backPage': RoutesNames.orderingService
                  });
                },
                child: const Text(
                  'Добавить питомца',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedElevatedButton(
                onPressed: () {
                  if (date.toString().isEmpty ||
                      time == null ||
                      price == null ||
                      petIds == null) {
                    CustomSnackBar.showError(
                        context, 'Не все данные выбраны для заказа');
                  } else {
                    // context
                    //     .read<OrderBloc>()
                    //     .add(OrderEvent.addOrder(order: order, petIds: petIds));
                    // // context.read<AddOrderBloc>().add(
                    // //       AddOrderEvent.addOrder(
                    // //         order: Order(
                    // //           idService: idService,
                    // //           duration: duration!,
                    // //           price: price!,
                    // //           date: date.toString(),
                    // //           time: time!,
                    // //           status: 'Заказ принят',
                    // //           titleService: titleService,
                    // //           namePet: namePet,
                    // //         ),
                    // //         petIds: petIds!,
                    // //       ),
                    // //     );
                  }
                },
                widget: Container(),
                // widget: BlocBuilder<AddOrderBloc, AddOrderState>(
                //     builder: (context, state) {
                //   return state.maybeMap(
                //       success: (_) => CircularProgressIndicator(),
                //       orElse: () {
                //         return Text('Заказать');
                //       });
                // }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showTimePicker() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor,
            )),
            child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child!),
          );
        });
    if (result != null) {
      setState(() {
        time =
            '${result.hour.toString().padLeft(2, '0')}:${result.minute.toString().padLeft(2, '0')}';
      });
    }
  }

  // OrderModel createOrder() => OrderModel(idService: idService, duration: duration!, price: price!, date: date, time: time!, status: status);
}
