import 'dart:convert';

import 'package:Vitals/database/vital_reprository.dart';
import 'package:Vitals/model/medicine_model.dart';
import 'package:Vitals/view/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:Vitals/main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Vital> dataFromJson(String str) =>
      List<Vital>.from(json.decode(str).map((x) => Vital.vitalMapToObject(x)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text('Settings'),
        ),
      ),
      body: Container(
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
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomButton(
                  icon: Icon(
                    Icons.cloud,
                  ),
                  text: 'Account Sync',
                  onTap: accountAsync
                  
                ),
                CustomButton(
                  icon: Icon(Icons.calendar_today_outlined),
                  text: 'First Day of Week',
                  onTap: () {
                    print('First Day of Week');
                  },
                ),
                CustomButton(
                  icon: Icon(
                    Icons.star_outline,
                  ),
                  text: 'Rate Us',
                  onTap: () {
                    print('Rate us');
                  },
                ),
                CustomButton(
                  icon: Icon(
                    Icons.share,
                  ),
                  text: 'Share App',
                  onTap: () {
                    print('Share App');
                  },
                ),
                CustomButton(
                  icon: Icon(
                    Icons.privacy_tip_sharp,
                  ),
                  text: 'Privacy Policy',
                  onTap: () {
                    print('Privacy Policy');
                    print('love privacy');
                  },
                ),
                CustomButton(
                    icon: Icon(
                      Icons.menu,
                    ),
                    text: 'Version',
                    onTap: () => print('Version'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void accountAsync() {
    print('Account Async');
  }
}
