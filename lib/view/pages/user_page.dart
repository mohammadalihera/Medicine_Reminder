import 'package:Vitel/Authentication/g_auth.dart';
import 'package:Vitel/controller/auth_user_controller.dart';
import 'package:Vitel/main.dart';
import 'package:Vitel/view/widgets/userprofile/next_dose.dart';
import 'package:Vitel/view/widgets/userprofile/user_info.dart';
import 'package:Vitel/view/widgets/userprofile/user_page_buttons.dart';
import 'package:Vitel/view/widgets/userprofile/week_medicine_widget.dart';
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
          backgroundColor: kPrimaryColor,
          appBar: AppBar(
            elevation: 0.0,
            title: Center(
              child: Text('My Profile'),
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 0),
            height: MediaQuery.of(context).size.height,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffEDF7FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserInfoWidget(userTitle, userCred, userImg),
                    NextDoseWidget(),
                    Center(
                      child: Text(
                        'Next 7 Days Medicine',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    NextWeekMedicine(),
                    UserPageButtons(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
