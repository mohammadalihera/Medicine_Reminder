import 'package:Vitals/Authentication/g_auth.dart';
import 'package:Vitals/controller/sign_in_controller.dart';
import 'package:Vitals/view/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:Vitals/view/widgets/sign_up_widget/sign_up_text_fields.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Vitals/main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

import '../../../main.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignInController signInController = Get.put(SignInController());
  Box<String> userBox = Hive.box('userBox');

  GoogleSignInAccount? _user;

  @override
  Widget build(BuildContext context) {
    print(userBox.getAt(0));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEDF7FF),
        actions: [
          InkWell(
            onTap: null,
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
                    color: Colors.blue,
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
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  print('hhii');
                  // Get.find<SignInController>().signedIn();
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue,
                  ),
                  margin: EdgeInsets.only(left: 33, right: 33),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                    'Get OTP',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  googleLogin();
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
              )
            ]),
      ),
    );
  }
}
