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
    String photoURL = '';
    String name = '';
    String email = '';

    if (firebaseUser!.phoneNumber == '') {
      // ignore: todo
      // TODO: Print user general info when guser is avbailable
      // print name phone number and other stuff if mobile user is created. with conditional either male or faemal image
      print(firebaseUser);
      // photoURL = firebaseUser!.photoURL!;
      // name = firebaseUser!.displayName!;
      // email = firebaseUser!.email!;
    } else {
      photoURL = 'K';
      name = 'K';
      email = 'k';
    }
    return Scaffold(
      backgroundColor: Color(0xffEDF7FF),
      appBar: AppBar(
        title: Text('User Profile'),
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
                child: Text('LogOut'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
