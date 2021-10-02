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
          print(userTitle + userCred);
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
                  maxRadius: 45,
                  minRadius: 20,
                  backgroundImage: NetworkImage(userImg),
                ),
              ),
              Container(
                width: 170,
                margin: EdgeInsets.only(top: 10, bottom: 3),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: kPrimaryColor,
                  ),
                ),
                child: Center(
                  child: Text(
                    userTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: Center(
                  child: Text(
                    userCred,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                decoration: new BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: kPrimaryColor.withOpacity(0.15),
                      spreadRadius: 3,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: kPrimaryColor,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Next Dose',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '09:00' + 'AM',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text('Next 7 Days Medicine',
                    style: TextStyle(
                      fontSize: 16,
                    )),
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
