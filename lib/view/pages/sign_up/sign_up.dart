import 'package:Vitel/Authentication/g_auth.dart';
import 'package:Vitel/controller/auth_user_controller.dart';
import 'package:Vitel/controller/caching_controller/cache_controller.dart';
import 'package:Vitel/controller/sign_in_controller.dart';
import 'package:Vitel/database/caching/cache.dart';
import 'package:Vitel/main.dart';
import 'package:Vitel/view/pages/home/home_page.dart';
import 'package:Vitel/view/widgets/sign_up_widget/sign_up_text_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../main.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignInController signInController = Get.put(SignInController());

  AuthUserController authUserController = Get.put(AuthUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEDF7FF),
        actions: [
          InkWell(
            onTap: () {
              Get.find<CacheController>().changeSkip('skip');
              print(CacheService.instance.skipLogin.get('skipLogin'));
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) {
                    return Dashboard();
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    'Skip',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.arrow_right_alt_sharp,
                    color: kPrimaryColor,
                    size: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: Color(0xffEDF7FF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                margin: EdgeInsets.only(
                  top: 50,
                  left: MediaQuery.of(context).size.width * 0.097,
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                margin: EdgeInsets.only(
                  top: 2.5,
                  left: MediaQuery.of(context).size.width * 0.097,
                ),
                child: Text(
                  'Sign In To Get Started!',
                  style: TextStyle(
                      color: Color(0xff606365).withOpacity(0.6),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            TextFieldWidget(),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                googleLogin().then(
                  (result) {
                    // ignore: unnecessary_null_comparison
                    if (result != '') {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) {
                            User? firebaseUser =
                                FirebaseAuth.instance.currentUser;

                            // this means google login
                            String username =
                                firebaseUser?.displayName.toString() ??
                                    'Google Username';
                            String email = firebaseUser?.email.toString() ??
                                'Google User Email';
                            String image = firebaseUser?.photoURL.toString() ??
                                'https://image.pngaaa.com/677/884677-middle.png';

                            Get.find<AuthUserController>()
                                .updateVal(username, email, '', image);

                            return Dashboard();
                          },
                        ),
                      );
                    }
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    width: 2,
                    color: kPrimaryColor,
                  ),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        "assets/images/google.svg",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Center(
                      child: Text(
                        'Sign up with Google',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
