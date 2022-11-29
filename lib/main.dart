import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tingting/controllers/local_notification_services.dart';
import 'package:tingting/route/route.dart';
import 'package:tingting/theme/ting_ting_app_theme.dart';
import 'localizations/localization_service.dart';
import 'theme/ting_ting_app_color.dart';

Future<void>backgroundHandler(RemoteMessage message) async {
  print('${message.data}');
}

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: TingTingAppColor.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationServices.initialize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: CustomRoute.initRoute,
        theme: TingTingAppTheme.buildTheme(),
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),
      ),
    ),
  );
}
