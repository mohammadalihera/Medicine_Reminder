import 'package:Vitals/Authentication/g_auth.dart';
import 'package:Vitals/main.dart';
import 'package:flutter/material.dart';

class UserPageButtons extends StatefulWidget {
  const UserPageButtons({Key? key}) : super(key: key);

  @override
  _UserPageButtonsState createState() => _UserPageButtonsState();
}

class _UserPageButtonsState extends State<UserPageButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
    );
  }
}
