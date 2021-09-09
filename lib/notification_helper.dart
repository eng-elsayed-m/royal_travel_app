import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class NotificationHelper {
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  Future initialNotifier() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin!.initialize(
      initSetttings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future onSelectNotification(String? payload) async {
    return debugPrint("payload : $payload");
  }

  showNotification(int id, String title, String body) async {
    await initialNotifier();
    await Future.delayed(Duration(seconds: 2));
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high, importance: Importance.max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin!
        .show(id, title, body, platform, payload: 'notification clicked');
  }
}
