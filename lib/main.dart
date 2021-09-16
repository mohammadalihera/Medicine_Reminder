import 'package:Vitals/view/pages/home/home_page.dart';
import 'package:Vitals/view/pages/sign_up/sign_up.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:Vitals/controller/sign_in_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  User? firebaseUser = FirebaseAuth.instance.currentUser;
  Widget firstWidget = SignUpPage();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (firebaseUser != null) {
      print('logged in');
      //print(firebaseUser.uid);
      firstWidget = Dashboard();
    } else {
      print('NOT logged in');
      firstWidget = SignUpPage();
    }

    return MaterialApp(
      supportedLocales: [
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate
      ],
      debugShowCheckedModeBanner: false,
      title: 'Vitals',
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        canvasColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
      home: firstWidget,
    );
  }
}
