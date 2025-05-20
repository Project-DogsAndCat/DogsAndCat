import 'dart:convert';
import 'dart:io';

import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/repositories/send_message_http_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../core/error/failure.dart';

class SendMessageHttpRepositoryImpl implements SendMessageHttpRepository {
  @override
  Future<Either<Failure, Unit>> sendMessage({
    required String userFcmToken,
    required Dogsitter dogsitter,
    required String serviceTitle,
    required OrderModel order,
  }) async {
    try {
      final url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/dogs-and-cats-1b675/messages:send',
      );
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ',
          },
          body: jsonEncode({
            "message": {
              "token": userFcmToken,
              "notification": {
                "title": "Ваш заказ приняли",
                "body": "Вас будет обслуживать $dogsitter",
              },
              "data": {
                "id": dogsitter.person.id,
                "name":
                    "${dogsitter.person.firstName} ${dogsitter.person.firstName}",
                "price": order.price,
                "serviceTitle": serviceTitle
              }
            }
          }));
      if (response.statusCode != 200) return left(Failure(message: 'Ошибка'));

      return right(unit);
    } on SocketException catch (_) {
      return left(Failure(message: AppString.internetNotFound));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
