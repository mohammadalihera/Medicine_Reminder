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
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
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
              backgroundImage: NetworkImage(user.photoURL!),
            ),
          ),
          Center(
            child: Text(
              user.displayName!,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
              ),
            ),
          ),
          Center(
            child: Text(
              user.email!,
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
