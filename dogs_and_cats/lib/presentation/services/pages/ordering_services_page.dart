import 'package:dogs_and_cats/core/routes/route_names.dart';
import 'package:dogs_and_cats/core/theme/app_colors.dart';
import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/presentation/auth/widgets/custom_snackbar.dart';
import 'package:dogs_and_cats/presentation/order/order_bloc/order_bloc.dart';
import 'package:dogs_and_cats/presentation/services/ordering_service_bloc/ordering_service_bloc.dart';
import 'package:dogs_and_cats/presentation/services/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/theme.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import '../../../domain/models/order.dart';
import '../widgets/duration_and_price_selection_widget.dart';
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
  TimeOfDay? time;
  List<String>? petIds;
  String? namePet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AppString.orderingService',
          style: textTheme.titleMedium,
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            context.replaceNamed(RoutesNames.services);
          },
        ),
      ),
      body: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          state.mapOrNull(failure: (value) {
            CustomSnackBar.showError(context, value.message);
          }, loaded: (value) {
            context.goNamed(
              RoutesNames.orderPage,
            );
          });
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AppString.durationService',
                  style: textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<OrderingServiceBloc, OrderingServiceState>(
                    builder: (context, state) {
                  return state.map(
                    loaded: (value) {
                      idService = value.idService;
                      titleService = value.titleService;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            value.characteristics.length,
                            (int index) {
                              return DurationAndPriceSelectionWidget(
                                index: index,
                                duration: value.characteristics[index].time,
                                price: value.characteristics[index].price,
                                selected: _selectedValue == index,
                                onSelected: (String duration, double price) {
                                  setState(() {
                                    _selectedValue = index;
                                    this.duration = duration;
                                    this.price = price;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                    loading: (_) => Center(child: CircularProgressIndicator()),
                    failure: (state) => Text(state.message),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Text('${DateFormat.MMMMEEEEd().format(date)}, ${time ?? ''}'),
                const SizedBox(
                  height: 10,
                ),
                DatePickerWidget(
                  height: 100,
                  width: 80,
                  daysCount: 15,
                  onDateChange: (selectedDate) {
                    setState(() {
                      date = selectedDate;
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
                        'AppString.selectTime',
                      ),
                      Text(time != null ? '${time!.hour}:${time!.minute}' : ''),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('AppString.forWhichPets'),
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
                    AppString.addPet,
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
                          context, 'AppString.noDataSelected');
                    } else {
                      context.read<OrderBloc>().add(
                            OrderEvent.addOrder(
                              order: OrderModel(
                                serviceId: idService,
                                duration: duration!,
                                price: price!,
                                date: date.copyWith(
                                    hour: time!.hour, minute: time!.minute),
                              ),
                              petIds: petIds!,
                            ),
                          );
                    }
                  },
                  widget: BlocBuilder<OrderBloc, OrderState>(
                      builder: (context, state) {
                    return state.maybeMap(
                        loaded: (_) => CircularProgressIndicator(),
                        orElse: () {
                          return Text(AppString.weight);
                        });
                  }),
                )
              ],
            ),
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
        time = TimeOfDay(hour: result.hour, minute: result.minute);
      });
    }
  }
}
