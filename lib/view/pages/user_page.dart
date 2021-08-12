import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDF7FF),
      appBar: AppBar(title: Text('Userpage'),),
      body: Center(child: Text('User Info Page'),),
      
    );
  }
}