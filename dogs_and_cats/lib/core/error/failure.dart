import 'package:supabase_flutter/supabase_flutter.dart';

class Failure {
  Failure({required this.message});
  final String message;
}

Failure authException(AuthApiException exception) {
  switch (exception.statusCode) {
    case '400':
      return Failure(message: 'Непральный E-mail или пароль');
    case '429':
      return Failure(message: 'Слишком много запросов');
    case '500':
      return Failure(message: 'Внутренняя ошибка сервера');
    default:
      return Failure(message: 'Аутентификация');
  }
}
