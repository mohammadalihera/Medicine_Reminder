import 'package:Vitals/Authentication/g_auth.dart';
import 'package:Vitals/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  User? firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    String photoURL = 'k';
    String name = 'k';
    String email = 'k';

    if (firebaseUser!.email.toString() != '' &&
        firebaseUser!.phoneNumber == null) {
      // ignore: todo
      // TODO: Print user general info when guser is avbailable
      // print name phone number and other stuff if mobile user is created. with conditional either male or female image
      print(firebaseUser);
      photoURL = firebaseUser?.photoURL ??
          'https://image.pngaaa.com/677/884677-middle.png';
      name = firebaseUser?.displayName ?? 'UserName';
      email = firebaseUser?.email ?? 'UserEmail';
      print(dashname);
    } else {
      photoURL =
          'https://icon-library.com/images/cool-phone-icon/cool-phone-icon-20.jpg';
      name = 'UserName';
      email = firebaseUser?.phoneNumber ?? 'UserPhone';
      print(dashname);
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
              backgroundImage: NetworkImage(photoURL),
            ),
          ),
          Center(
            child: Text(
              name,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
              ),
            ),
          ),
          Center(
            child: Text(
              email,
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
  }
}
