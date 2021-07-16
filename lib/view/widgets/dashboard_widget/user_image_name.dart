import 'package:flutter/material.dart';

class UserNameImage extends StatefulWidget {
  @override
  _UserNameImageState createState() => _UserNameImageState();
}

class _UserNameImageState extends State<UserNameImage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        children: <Widget>[
          Container(
            height: 81,
            width: 81,
            child: CircleAvatar(
              radius: 81,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Hey there,John',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 5),
          Divider(
            thickness: 2,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
