import 'package:Vitel/controller/auth_user_controller.dart';
import 'package:Vitel/database/caching/cache.dart';
import 'package:Vitel/main.dart';
import 'package:Vitel/view/pages/sign_up/sign_up.dart';
import 'package:Vitel/view/widgets/userprofile/next_dose.dart';
import 'package:Vitel/view/widgets/userprofile/user_info.dart';
import 'package:Vitel/view/widgets/userprofile/user_page_buttons.dart';
import 'package:Vitel/view/widgets/userprofile/week_medicine_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    CacheService.instance.initSkipLoginHive();

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
          backgroundColor: kPrimaryColor,
          appBar: AppBar(
            elevation: 0.0,
            title: Center(
              child: Text('My Profile'),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 0),
              height: MediaQuery.of(context).size.height,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffEDF7FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: CacheService.instance.skipLogin.get('skipLogin').toString().isEmpty
                    ? SingleChildScrollView(
                        padding: EdgeInsets.only(top: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CacheService.instance.skipLogin.get('skipLogin').toString().isEmpty
                                ? UserInfoWidget(userTitle, userCred, userImg)
                                : SizedBox(),
                            NextDoseWidget(),
                            Center(
                              child: Text(
                                'Next 7 Days Medicine',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            NextWeekMedicine(),
                            UserPageButtons(),
                          ],
                        ),
                      )
                    : Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => SignUpPage()), (Route<dynamic> route) => false);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(color: Colors.blue)),
                            child: Text(
                              'Log In Please ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
