import 'dart:convert';

import 'package:Vitel/controller/caching_controller/cache_controller.dart';
import 'package:Vitel/database/vitel_reprository.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:Vitel/view/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:Vitel/main.dart';
import 'package:get/get.dart';

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
                CustomButton(
                    icon: Icon(
                      Icons.cloud,
                    ),
                    text: 'Account Sync',
                    onTap: accountAsync),
                /* CustomButton(
                  icon: Icon(Icons.calendar_today_outlined),
                  text: 'First Day of Week',
                  onTap:()=>_showDialog() /* () {
                    // Get.find<CacheController>().changeFristDayOfWeek('Mon');
                    _showDialog();
                  }, */
                ), */
                TextButton(
                  onPressed: () => _showDialog(),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, bottom: 40),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_outlined),
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

  void _showDialog() {
    // flutter defined function
    List<String> days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
    CacheService.instance.initFirstDayHive();

    String firstDay =
        CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return GetBuilder<GetMedicineController>(
            init: GetMedicineController(),
            builder: (getvitalController) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(50.0),
                    ),
                    color: kPrimaryColor,
                  ),
                  height: 250,
                  width: 280,
                  child: Container(
                    margin: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: Center(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 100,
                                childAspectRatio: 4 / 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 10),
                        itemCount: days.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.find<GetMedicineController>()
                                  .changeFristDayOfWeek(days[index]);

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.all(
                                  const Radius.circular(5.0),
                                ),
                                color: getvitalController.firstDayOfWeek== days[index]
                                    ? Color.fromARGB(255, 200, 87, 220)
                                    : Colors.white,
                              ),
                              height: 10,
                              width: 50,
                              child: Center(
                                child: Text(
                                  days[index],
                                  style: TextStyle(
                                      color: getvitalController.firstDayOfWeek == days[index]
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
