import 'package:Vitals/Authentication/g_auth.dart';
import 'package:Vitals/controller/auth_user_controller.dart';
import 'package:Vitals/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  User? firebaseUser = FirebaseAuth.instance.currentUser;
  AuthUserController authUserController = Get.put(AuthUserController());

  @override
  Widget build(BuildContext context) {
    String userTitle = '';
    String userCred = '';
    String userImg = '';

    return GetBuilder<AuthUserController>(
      init: AuthUserController(),
      builder: (authController) {
        if (authController.userName != '' && authController.userPhone == '') {
          // this means google user
          userTitle = authController.userName;
          userCred = authController.userEmail;
          userImg = authController.imageURL;
        } else {
          userTitle = authController.userName;
          userCred = authController.userPhone;
          userImg = authController.imageURL;
        }
        return Scaffold(
          backgroundColor: Color(0xffEDF7FF),
          appBar: AppBar(
            title: Center(
              child: Text('My Profile'),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(userImg),
                ),
              ),
              Center(
                child: Text(
                  userTitle,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Center(
                child: Text(
                  userCred,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    logout(context);
                  },
                  child: Container(
                    child: Text('Log Out'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
