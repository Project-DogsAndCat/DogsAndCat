import 'dart:convert';

import 'package:dogs_and_cats/notification_bottom_sheet.dart';
import 'package:dogs_and_cats/presentation/dogsitter/adding_information/cubits/image_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../domain/repositories/user_fcm_repository.dart';
import '../dependency/dependencies.dart';
import '../routes/routes.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initFcm() async {
    final localNotifications = FlutterLocalNotificationsPlugin();

    await localNotifications.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (response) {
        if (response.payload != null) {
          handleNavigation(response.data);
        }
      },
    );

    await _upsertToken();

    // Обработка уведомлений, которые привели к запуску приложения
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) handleNavigation(message.data);
    });

    // Клик по уведомлению
    FirebaseMessaging.onMessageOpenedApp
        .listen((message) => handleNavigation(message.data));
  }

  void handleNavigation(Map<String, dynamic> data) {
    Future.delayed(Duration(milliseconds: 300), () {
      showDialog(
          context: navigatorKey.currentContext!,
          builder: (newContext) => BlocProvider(
                create: (context) => getIt<ImageCubit>(),
                child: NotificationBottomSheet(message: data),
              ));
    });
  }

  Future<void> _upsertToken() async {
    final token = await _firebaseMessaging.getToken();
    if (token != null) {
      await getIt<UserFcmRepository>().upsertFcmToken(token: token);
    }
  }

  Future<void> refreshToken() async {
    _firebaseMessaging.onTokenRefresh.listen((newToken) =>
        getIt<UserFcmRepository>().upsertFcmToken(token: newToken));
  }

  void showNotification(
    RemoteMessage message,
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    AndroidNotificationChannel channel,
  ) {
    final notification = message.notification;
    final android = message.notification?.android;
    final apple = message.notification?.apple;
    if (notification != null && (android != null || apple != null)) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: const DarwinNotificationDetails(),
        ),
        payload: jsonEncode(message.data),
      );
    }
  }
}
