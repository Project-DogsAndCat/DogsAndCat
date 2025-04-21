// class Task {
//   Task({
//     required this.orderId,
//     required this.serviceTitle,
//     required this.duration,
//     required this.price,
//     required this.date,
//     required this.orderStatus,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.phone,
//     required this.latitude,
//     required this.longitude,
//     required this.image,
//   });
//   final String orderId;
//   final String serviceTitle;
//   final String duration;
//   final double price;
//   final DateTime date;
//   final Status orderStatus;
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String phone;
//   final double latitude;
//   final double longitude;
//   final String image;
// }

import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/models/person.dart';

class Task {
  Task({
    required this.serviceTitle,
    required this.order,
    required this.person,
  });
  final String serviceTitle;
  final OrderModel order;
  final Person person;
}
