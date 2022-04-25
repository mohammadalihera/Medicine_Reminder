import 'package:Vitel/Authentication/g_auth.dart';
import 'package:Vitel/database/caching/cache.dart';
import 'package:Vitel/view/pages/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class UserPageButtons extends StatefulWidget {
  const UserPageButtons({Key? key}) : super(key: key);

  @override
  _UserPageButtonsState createState() => _UserPageButtonsState();
}

class _UserPageButtonsState extends State<UserPageButtons> {
  @override
  Widget build(BuildContext context) {
    CacheService.instance.initSkipLoginHive();

    return SingleChildScrollView(
      child: CacheService.instance.skipLogin.get('skipLogin').toString().isEmpty
          ? Column(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    // todo
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
                    //todo
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
            )
          : InkWell(
              onTap: () {
                //todo
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()),
                              (Route<dynamic> route) => false);
                        },
                        child: Container(
                          child: Text(
                            'Log In ',
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
    );
  }
}
