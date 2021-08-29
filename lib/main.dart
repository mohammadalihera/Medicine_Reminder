import 'package:MedicineReminder/view/pages/home/home_page.dart';
import 'package:MedicineReminder/view/pages/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MedicineReminder/controller/sign_in_controller.dart';

void main() {
  runApp(MyApp());
}

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
                primarySwatch: Colors.blue,
                canvasColor: Colors.white,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: signInController.signIn?Dashboard(): SignUpPage() //Dashboard(),
              );
        });
  }
}
