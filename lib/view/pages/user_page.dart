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
          body: ClipRRect(
            // TODO: corner radius
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 50),
              child: Column(
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
                    width: 190,
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
                          fontSize: 20,
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
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
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
                    child: Text(
                      'Next 7 Days Medicine',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      padding: EdgeInsets.only(left: 50, right: 50),
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Card(
                                margin: EdgeInsets.only(right: 40),
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
                                    width: 70,
                                    height: 70,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            '21',
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
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                child: Center(
                                  child: Text(
                                    'Napa',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Card(
                                margin: EdgeInsets.only(right: 40),
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
                                    width: 70,
                                    height: 70,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            '07',
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
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                child: Center(
                                  child: Text(
                                    'Indomnate',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Card(
                                margin: EdgeInsets.only(right: 40),
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
                                    width: 70,
                                    height: 70,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            '17',
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
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                child: Center(
                                  child: Text(
                                    'Max Pro',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Card(
                                margin: EdgeInsets.only(right: 40),
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
                                    width: 70,
                                    height: 70,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            '14',
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
                              Container(
                                margin: EdgeInsets.only(right: 40),
                                child: Center(
                                  child: Text(
                                    'Paracetamol',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // todo
                      print('Edit Profile Tapped');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: kPrimaryColor,
                      ),
                      margin: EdgeInsets.only(left: 33, right: 33, top: 40),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Center(
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          width: 2,
                          color: kPrimaryColor,
                        ),
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.6,
                      margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: TextButton(
                              onPressed: () {
                                logout(context);
                              },
                              child: Container(
                                child: Text(
                                  'Log Out',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
