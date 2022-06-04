import 'package:Vitel/controller/caching_controller/cache_controller.dart';
import 'package:Vitel/view/pages/home/home_page.dart';
import 'package:Vitel/view/pages/sign_up/sign_up.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

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
      'resource://drawable/logo',
      //null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultRingtoneType: DefaultRingtoneType.Ringtone,

          // defaultColor: Color(0xffaa2233),
          //ledColor: Colors.blue,
          soundSource: 'resource://raw/vitel_medicine_ring',
          defaultColor: Colors.transparent,
          ledColor: Colors.white,
          playSound: true,
          enableVibration: true,
          onlyAlertOnce: false,
          importance: NotificationImportance.High,
        ),
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
  try {
    if (!Hive.isBoxOpen('skipLogin')) await Hive.openBox<String>('skipLogin');
  } catch (error) {
    await Hive.deleteBoxFromDisk('skipLogin');
    await Hive.openBox('skipLogin');
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
    CacheService.instance.initSkipLoginHive();
    CacheService.instance.firstDayOfWeek.get('firstDayOfWeek') != null
        ? Get.find<CacheController>().changeFristDayOfWeek(CacheService
            .instance.firstDayOfWeek
            .get('firstDayOfWeek')
            .toString())
        : Get.find<CacheController>().changeFristDayOfWeek('Sun');
    CacheService.instance.skipLogin.get('skipLogin') != null
        ? Get.find<CacheController>().changeSkip(
            CacheService.instance.skipLogin.get('skipLogin').toString())
        : Get.find<CacheController>().changeSkip('');
    if (firebaseUser != null) {
      //  print('email');
      Get.find<CacheController>().changeSkip('');
      print('phone' + firebaseUser!.phoneNumber.toString());
      if (firebaseUser!.email.toString() != '' &&
          (firebaseUser!.phoneNumber == null ||
              firebaseUser!.phoneNumber == '')) {
        // this means google login
        Get.find<CacheController>().changeFristDayOfWeek('');
        print('email' + firebaseUser!.email.toString());
        String username = firebaseUser!.displayName.toString();
        String email = firebaseUser!.email.toString();
        String image = firebaseUser!.photoURL.toString();

        Get.find<AuthUserController>().updateVal(username, email, '', image);
      } else {
        // this means phone login
        print('email' + firebaseUser!.email.toString());
        String phoneNumber = firebaseUser!.phoneNumber.toString();

        String image =
            'https://icon-library.com/images/cool-phone-icon/cool-phone-icon-20.jpg';

        Get.find<AuthUserController>()
            .updateVal('Phone User', '', phoneNumber, image);
      }
      firstWidget = Dashboard();
    } else if (CacheService.instance.skipLogin.get('skipLogin') == 'skip') {
      firstWidget = Dashboard();
    } else {
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
        title: 'Vitel',
        
        theme: ThemeData(
          
          primarySwatch: kPrimaryColor,
          canvasColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Poppins',
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        
        ),

       builder: (context, child) {
    return MediaQuery(
      child: firstWidget,
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
    );
   },
        home: AnimatedSplashScreen(
            duration: 1000,
            splashIconSize: 400,
            splash: Container(
              height: 400,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      'assets/logo/logo.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Text('Vitel',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontFamily: 'Advent Pro'))
                ],
              ),
            ),
            nextScreen: firstWidget,
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: kPrimaryColor));
  }
}
