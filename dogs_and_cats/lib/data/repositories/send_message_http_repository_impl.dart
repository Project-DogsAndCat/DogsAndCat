import 'dart:convert';
import 'dart:io';

import 'package:dogs_and_cats/core/utils/app_strings.dart';
import 'package:dogs_and_cats/domain/models/dogsitter.dart';
import 'package:dogs_and_cats/domain/models/order.dart';
import 'package:dogs_and_cats/domain/repositories/send_message_http_repository.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:googleapis_auth/auth_io.dart';
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
      final token = await _getAccessToken();
      final url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/dogs-and-cats-1b675/messages:send',
      );
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            "message": {
              "token": userFcmToken,
              "notification": {
                "title": "Ваш заказ приняли",
                "body":
                    "Вас будет обслуживать ${dogsitter.person.firstName} ${dogsitter.person.lastName}",
              },
              "data": {
                "id": dogsitter.person.id,
                "name": "Name",
                "price": "${order.price}",
                "serviceTitle": "Заказ $serviceTitle"
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

  // аутентифицированный HTTP-клиент
  // Авторизованный HTTP-клиент теперь может получать доступ к API
  Future<String> _getAccessToken() async {
    final accountCredentials = ServiceAccountCredentials.fromJson(
      await rootBundle
          .loadString('assets/json_key/dogs-and-cats-1b675-33e30306df42.json'),
    );
    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    final client = await clientViaServiceAccount(accountCredentials, scopes);
    final authHeaders = client.credentials.accessToken.data;
    return authHeaders;
  }
}
