import 'dart:convert';
import 'dart:io';

import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/domain/repositories/send_message_http_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../core/error/failure.dart';

class SendMessageHttpRepositoryImpl implements SendMessageHttpRepository {
  @override
  Future<Either<Failure, Unit>> sendMessage(
      {required String userFcmToken, required String dogsitter}) async {
    try {
      final url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/dogs-and-cats-1b675/messages:send',
      );
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer ...',
          },
          body: jsonEncode({
            "message": {
              "token":
                  '...',
              "notification": {
                "title": "Ваш заказ приняли",
                "body": "Вас будет обслуживать $dogsitter",
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
