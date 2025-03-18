import 'package:dogs_and_cats/presentation/services/ordering_service_bloc/ordering_service_bloc.dart';
import 'package:dogs_and_cats/presentation/services/widgets/custom_service_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderingServicePage extends StatefulWidget {
  const OrderingServicePage({super.key});

  @override
  State<OrderingServicePage> createState() => _OrderingServiceState();
}

class _OrderingServiceState extends State<OrderingServicePage> {
  _OrderingServiceState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ услуги'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<OrderingServiceBloc, OrderingServiceState>(
            builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loading: (_) => Center(child: CircularProgressIndicator()),
            loaded: (state) => Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 75,
                  ),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomServiceButton(
                            onPressed: () {},
                            nameService: state.characteristics[index].time,
                            description:
                                '${state.characteristics[index].price.toString()} руб');
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: state.characteristics.length),
                ),
              ],
            ),
            failure: (state) => Text(state.message),
            success: (_) => Container(),
          );
        }),
      ),
    );
  }
}
