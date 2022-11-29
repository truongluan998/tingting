import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tingting/controllers/local_notification_services.dart';
import 'package:tingting/views/widgets/app_button.dart';

import '../../theme/ting_ting_app_color.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  void initState() {
    super.initState();

    /// Terminal
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print('app is terminal');
      if (message != null) {
        print('new notification');
        LocalNotificationServices.createNotification(message);
      }
    });

    /// foreground
    FirebaseMessaging.onMessage.listen((message) {
      print('app is running foreground');
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        LocalNotificationServices.createNotification(message);
      }
    });

    /// background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('app is running background');
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        LocalNotificationServices.createNotification(message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo FireBase', style: TextStyle(color: TingTingAppColor.mainColor)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppButton(
            onPressed: () async {
              await LocalNotificationServices.scheduleNotification(
                id: 1999,
                title: 'Text Schedule Noti',
                body: 'Body Schedule Notification',
                hour: 21,
                minutes: 00,
              );
            },
            child: const Text('Set Noti'),
          ),
          AppButton(
            onPressed: () {
              var fireStore = FirebaseFirestore.instance.collection('users').doc('my_doc');
              fireStore.get().then((value) {
                setState(() {});
              });
            },
            child: const Text('Read'),
          ),
          AppButton(
            onPressed: () {
              var fireStore = FirebaseFirestore.instance.collection('users').doc('my_doc');
              fireStore.update({
                'name': 'occho',
              });
            },
            child: const Text('Update'),
          ),
          AppButton(
            onPressed: () {
              var fireStore = FirebaseFirestore.instance.collection('users').doc('my_doc');
              fireStore.delete();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
