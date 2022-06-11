import 'dart:convert';

import 'package:Vitel/main.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:Vitel/view/widgets/settings/first_day_of_week.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../controller/get_medicine/get_medicine.dart';
import '../../database/caching/cache.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Vitel> dataFromJson(String str) =>
      List<Vitel>.from(json.decode(str).map((x) => Vitel.vitelMapToObject(x)));
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
                TextButton(
                  onPressed: () {
                    showSnackbar(
                        context, 'This feature is not implemented yet!');
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        //Icon(Icons.cloud),
                        Container(
                            child: Image.asset(
                          'assets/images/settings/icons/Account Sync.png',
                          height: 25,
                          width: 25,
                          color: Colors.grey,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text('Account Sync',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    _showDialog();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/settings/icons/first_day_of_week.png',
                            height: 25,
                            width: 25,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text('First day of week',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    showSnackbar(
                        context, 'This feature is not implemented yet!');
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/images/settings/icons/rate_us.png',
                          height: 25,
                          width: 25,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text('Rate Us',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Share.share(
                        'Struggling to keep track of your daily medications? Download VITEL now:\n https://nerdevolution.tech/',
                        subject:
                            "Struggling to keep track of your daily medications");
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/images/settings/icons/share_app.png',
                          height: 25,
                          width: 25,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text('Share App',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 500),
                        padding: EdgeInsets.all(0),
                        backgroundColor: Colors.transparent,
                        content: Container(
                          height: 80,
                          //color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'This feature is not implemented yet!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/images/settings/icons/Privacy Policy.png',
                          height: 25,
                          width: 25,
                          color: Colors.grey,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text('Privacy policy',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 500),
                        padding: EdgeInsets.all(0),
                        backgroundColor: Colors.transparent,
                        content: Container(
                          height: 80,
                          //color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '1.0.0+1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/images/settings/icons/version.png',
                          height: 25,
                          width: 25,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text('Version',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void accountAsync() {
    Get.snackbar(
        'Account Sync will be implemented in future version', 'Get in touch');
  }

  void _showDialog() {
    CacheService.instance.initFirstDayHive();

    String firstDay =
        CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return GetBuilder<GetMedicineController>(
          init: GetMedicineController(),
          builder: (getvitalController) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: FirstDayOfWeek());
          },
        );
      },
    );
  }

  void showSnackbar(BuildContext context, String toast) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        content: Container(
          height: 80,
          //color: Colors.white,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              toast,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
