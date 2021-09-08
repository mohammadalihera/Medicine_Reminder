import 'dart:io';

import 'package:Vitals/view/pages/home/home_page.dart';
import 'package:Vitals/view/pages/sign_up/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:Vitals/controller/sign_in_controller.dart';
import 'package:hive/hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = Directory.current.path;
  await Firebase.initializeApp();
  Hive.init(path);
  await Hive.openBox<String>('userBox');
  runApp(MyApp());
}

const MaterialColor kPrimaryColor = const MaterialColor(
  0xFF3A88DB,
  const <int, Color>{
    50: const Color(0xFF3A88DB),
    100: const Color(0xFF3A88DB),
    200: const Color(0xFF3A88DB),
    300: const Color(0xFF3A88DB),
    400: const Color(0xFF3A88DB),
    500: const Color(0xFF3A88DB),
    600: const Color(0xFF3A88DB),
    700: const Color(0xFF3A88DB),
    800: const Color(0xFF3A88DB),
    900: const Color(0xFF3A88DB),
  },
);

class MyApp extends StatelessWidget {
  SignInController signInController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Get.find<SignInController>().signedIn();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vitals',
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        canvasColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
      home: GetBuilder<SignInController>(
        init: SignInController(),
        builder: (signInController) {
          if (signInController.signIn) {
            return Dashboard();
          } else {
            return SignUpPage();
          } //Dashboard(),
        },
      ),
    );
  }
}
