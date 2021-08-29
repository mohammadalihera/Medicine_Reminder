import 'package:MedicineReminder/view/pages/home/home_page.dart';
import 'package:MedicineReminder/view/pages/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MedicineReminder/controller/sign_in_controller.dart';

void main() {
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
    return GetBuilder<SignInController>(
        init: SignInController(),
        builder: (signInController) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Medicine Reminder',
              theme: ThemeData(
                primarySwatch: kPrimaryColor,
                canvasColor: Colors.white,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: signInController.signIn
                  ? Dashboard()
                  : SignUpPage() //Dashboard(),
              );
        });
  }
}
