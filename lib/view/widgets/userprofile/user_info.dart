import 'package:flutter/material.dart';

import '../../../main.dart';

class UserInfoWidget extends StatefulWidget {
  String userImg, userTitle, userCred;
  UserInfoWidget(this.userTitle, this.userCred, this.userImg);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: CircleAvatar(
            maxRadius: 45,
            minRadius: 20,
            backgroundImage: NetworkImage(widget.userImg),
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
              widget.userTitle,
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
              widget.userCred,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}
