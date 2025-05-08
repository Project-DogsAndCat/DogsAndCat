import 'package:firebase_messaging/firebase_messaging.dart';

import '../../domain/repositories/user_fcm_repository.dart';
import '../dependency/dependencies.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    // ToDo something
  }

  Future<void> initFcm() async {
    final token = await _firebaseMessaging.getToken();
    if (token != null) {
      await getIt<UserFmcRepository>().upsertFmcToken(token: token);
    }
  }

  Future<void> refreshToken() async {
    _firebaseMessaging.onTokenRefresh.listen((newToken) =>
        getIt<UserFmcRepository>().upsertFmcToken(token: newToken));
  }

  Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
