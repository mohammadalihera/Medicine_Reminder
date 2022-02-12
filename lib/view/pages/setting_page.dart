import 'dart:convert';
import 'dart:io';
import 'package:Vitel/controller/caching_controller/cache_controller.dart';
import 'package:Vitel/database/vitel_reprository.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:Vitel/view/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:Vitel/main.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../controller/get_medicine/get_medicine.dart';
import '../../database/caching/cache.dart';
import 'package:social_share/social_share.dart';

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
                /* CustomButton(
                  icon: Icon(
                    Icons.share,
                  ),
                  text: 'Share App',
                  onTap: () {
                    print('Share App');
                  },
                ), */
                TextButton(
                  onPressed: () => _showBottomDialog(),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, bottom: 40),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_outlined),
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
                                color: getvitalController.firstDayOfWeek ==
                                        days[index]
                                    ? Color.fromARGB(255, 200, 87, 220)
                                    : Colors.white,
                              ),
                              height: 10,
                              width: 50,
                              child: Center(
                                child: Text(
                                  days[index],
                                  style: TextStyle(
                                      color:
                                          getvitalController.firstDayOfWeek ==
                                                  days[index]
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

  void _showBottomDialog() {
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
                    color: Colors.white,
                  ),
                  height: 250,
                  width: 280,
                  child: Container(
                    margin: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: Center(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                File file = await getImageFileFromAssets(
                                    'images/no_vital.png');
                                SocialShare.shareFacebookStory(
                                  file.path,
                                  "#ffffff",
                                  "#000000",
                                  "https://nerdevolution.tech/",
                                  appId: "12345",
                                ).then((data) {
                                  print(data);
                                });
                              },
                              child: Container(
                                // margin: EdgeInsets.only(left: 20),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/facebook.png',
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                File file = await getImageFileFromAssets(
                                    'images/no_vital.png');
                                SocialShare.shareInstagramStory(
                                  file.path,
                                  backgroundTopColor: "#ffffff",
                                  backgroundBottomColor: "#000000",
                                  attributionURL: "https://deep-link-url",
                                  backgroundImagePath: file.path,
                                ).then((data) {
                                  print(data);
                                });
                              },
                              child: Container(
                                //   margin: EdgeInsets.only(left: 10),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/instagram.png',
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                SocialShare.shareWhatsapp(
                                  "Install this app \n https://google.com",
                                ).then((data) {
                                  print(data);
                                });
                              },
                              child: Container(
                                //  margin: EdgeInsets.only(left: 10),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/whatsapp.png',
                                        ),
                                        fit: BoxFit.contain)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                File file = await getImageFileFromAssets(
                                    'images/no_vital.png');
                                SocialShare.shareTwitter(
                                  "Please Install the vitel app",
                                  hashtags: ["hello", "world", "foo", "bar"],
                                  url: "https://google.com/#/hello",
                                  trailingText: "\nhello",
                                ).then((data) {
                                  print(data);
                                });
                              },
                              child: Container(
                                //margin: EdgeInsets.only(left: 20),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/twitter.png',
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                
                                SocialShare.shareSms(
                                  "Please Install the vitel app",
                                  url: "\nhttps://google.com/",
                                  trailingText: "\nhello",
                                ).then((data) {
                                  print(data);
                                });
                              },
                              child: Container(
                                //margin: EdgeInsets.only(left:5),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(70),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/sms.png',
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                
                                SocialShare.copyToClipboard(
                                  "This is Social Share plugin",
                                ).then((data) {
                                  print(data);
                                });
                              },
                              child: Container(
                                //margin: EdgeInsets.only(left:5),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    /* borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ), */
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/copy.png',
                                        ),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                  ),
                ),
              );
            },
          );
        });
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String imagesAppDirectory = appDocDir.path;
    final file =
        await File('$imagesAppDirectory/$path').create(recursive: true);

    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  /* Future<void> saveImageF(String imagDetails) async {
  String imgPath = (imagDetails).substring(7);

  late File image;
  await getImageFileFromAssets(imgPath).then((file) => image = file);

  final extDir = await getExternalStorageDirectory();


  //  Path of file in android data files
  final myImagePath = '${extDir!.path}/images';


  //create the base name
  String basename = (imagDetails).substring(20);

  // File copied to ext directory.
  File newImage = await image.copy("$myImagePath/${p.basename(basename)}");

  print(newImage.path);
} */
}
