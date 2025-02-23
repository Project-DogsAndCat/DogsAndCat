import '../utils/app_strings.dart';

class ServerException implements Exception {
  final String message;

  ServerException([this.message = AppString.internalServerError]);
}
