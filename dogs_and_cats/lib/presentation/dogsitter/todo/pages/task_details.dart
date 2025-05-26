import 'package:dogs_and_cats/domain/models/location.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/routes/route_names.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/button_address.dart';
import '../../../../domain/models/task.dart';
import '../../../order/widgets/container_widget.dart';
import '../../../order/widgets/order_status_widget.dart';
import '../widgets/address_of_task.dart';
import '../widgets/pet_details_list_view_widget.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.orderDetails,
          style: textTheme.titleMedium,
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            context.pop(RoutesNames.todo);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 10,
          bottom: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              OrderStatusWidget(
                status: task.order.status.value,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                task.serviceTitle,
                style: textTheme.labelLarge,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                '${DateFormat.MMMMEEEEd('RU-ru').format(task.order.date)}, ${DateFormat.Hm('RU-ru').format(task.order.date)}',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                AppString.serviceFor,
                style: textTheme.labelLarge,
              ),
              const SizedBox(
                height: 10.0,
              ),
              PetDetailsListViewWidget(
                task: task,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ButtonAddress(
                person: task.person,
                widget: AddressOfTask(
                  appLatLong: AppLatLong(
                      lat: task.person.latitude, long: task.person.longitude),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                AppString.ordering,
                style: textTheme.labelLarge,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ContainerWidget(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildServiceInfo(),
                        Text(
                          '${task.order.price.toStringAsFixed(0)} руб',
                          style: textTheme.labelMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _buildPriceRow(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildServiceInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.costOfService,
          style: textTheme.labelMedium,
        ),
        const SizedBox(
          height: 3.0,
        ),
        Text(
          '${task.serviceTitle} ${task.order.duration}',
          style: textTheme.labelSmall,
        ),
      ],
    );
  }

  _buildPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString.forPayment,
          style: textTheme.labelMedium,
        ),
        Text(
          '${task.order.price.toStringAsFixed(0)} руб',
          style: textTheme.labelMedium,
        ),
      ],
    );
  }
}
