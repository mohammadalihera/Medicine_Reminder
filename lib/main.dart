import 'dart:io';

import 'package:Vitel/controller/caching_controller/cache_controller.dart';
import 'package:Vitel/view/pages/home/home_page.dart';
import 'package:Vitel/view/pages/sign_up/sign_up.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'controller/auth_user_controller.dart';
import 'controller/sign_in_controller.dart';
import 'database/caching/cache.dart';

String dashname = 'User';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DotEnv().load('.env');
  final directory = await getApplicationDocumentsDirectory();

  //return directory.path;
  Hive.init(directory.path);
  Get.lazyPut(() => CacheController());
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      // 'resource://drawable/logo',
      null,
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            // defaultColor: Color(0xffaa2233),
            //ledColor: Colors.blue,

            defaultColor: Colors.transparent,
            ledColor: Colors.white,
            playSound: true,
            enableVibration: true,
            importance: NotificationImportance.High)
      ]);

  // const AndroidInitializationSettings initializationSettingsAndroid =
  //     AndroidInitializationSettings('app_icon');
  // var box = await Hive.openBox('testBox');
  try {
    if (!Hive.isBoxOpen('firstDayOfWeek'))
      await Hive.openBox<String>('firstDayOfWeek');
  } catch (error) {
    await Hive.deleteBoxFromDisk('firstDayOfWeek');
    await Hive.openBox('firstDayOfWeek');
  }
  await Firebase.initializeApp();
  runApp(MyApp());
}

const MaterialColor kPrimaryColor = const MaterialColor(
  0xFF4168EE,
  const <int, Color>{
    50: const Color(0xFF4168EE),
    100: const Color(0xFF4168EE),
    200: const Color(0xFF4168EE),
    300: const Color(0xFF4168EE),
    400: const Color(0xFF4168EE),
    500: const Color(0xFF4168EE),
    600: const Color(0xFF4168EE),
    700: const Color(0xFF4168EE),
    800: const Color(0xFF4168EE),
    900: const Color(0xFF4168EE),
  },
);

class MyApp extends StatelessWidget {
  SignInController signInController = Get.put(SignInController());
  AuthUserController authUserController = Get.put(AuthUserController());
  User? firebaseUser = FirebaseAuth.instance.currentUser;
  Widget firstWidget = SignUpPage();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    CacheService.instance.initFirstDayHive();
    CacheService.instance.firstDayOfWeek.get('firstDayOfWeek') != null
        ? Get.find<CacheController>().changeFristDayOfWeek(CacheService
            .instance.firstDayOfWeek
            .get('firstDayOfWeek')
            .toString())
        : Get.find<CacheController>().changeFristDayOfWeek('Sun');
    print(
        CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString());
    if (firebaseUser != null) {
      print('logged in');
      //print(firebaseUser.uid);
      if (firebaseUser!.email.toString() != '' &&
          firebaseUser!.phoneNumber == null) {
        // this means google login
        String username = firebaseUser!.displayName.toString();
        String email = firebaseUser!.email.toString();
        String image = firebaseUser!.photoURL.toString();

        Get.find<AuthUserController>().updateVal(username, email, '', image);
      } else {
        // this means phone login
        String phoneNumber = firebaseUser!.phoneNumber.toString();
        print(phoneNumber);
        String image =
            'https://icon-library.com/images/cool-phone-icon/cool-phone-icon-20.jpg';

        Get.find<AuthUserController>()
            .updateVal('Phone User', '', phoneNumber, image);
      }
      firstWidget = Dashboard();
    } else {
      print('NOT logged in');
      firstWidget = SignUpPage();
    }

    // if (firebaseUser!.email.toString() != '' &&
    //     firebaseUser!.phoneNumber == null) {
    //   print('dashname set for guser');
    //   dashname = firebaseUser!.displayName.toString();
    //   print(dashname);
    // } else {
    //   print('Dashname set for phone user');
    //   dashname = firebaseUser!.phoneNumber.toString();
    //   print(dashname);
    // }

    return MaterialApp(
      supportedLocales: [
        Locale('en', 'US'),
      ],
      localizationsDelegates: [CountryLocalizations.delegate],
      debugShowCheckedModeBanner: false,
      title: 'Vitel',
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        canvasColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: Dashboard(),
    );
  }
}
