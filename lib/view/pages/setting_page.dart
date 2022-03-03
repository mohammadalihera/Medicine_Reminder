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
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
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
                    margin: EdgeInsets.only(left: 20, bottom: 40),
                    child: Row(
                      children: [
                        //Icon(Icons.cloud),
                        Container(child:Image.asset('assets/images/settings/Vector.png',color: Colors.grey,)),
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
                TextButton(
                  onPressed: () {
                   
                    _showDialog();
                    
                  },
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
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
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
                    margin: EdgeInsets.only(left: 20, bottom: 40),
                    child: Row(
                      children: [
                        Icon(Icons.star_outlined,color: Colors.grey,),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text('Rate Us ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _showBottomDialog(),
                  child: Container(
                    margin: EdgeInsets.only(left: 20, bottom: 40),
                    child: Row(
                      children: [
                        Container(child:Image.asset('assets/images/settings/share-2.png',)),
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
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
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
                    margin: EdgeInsets.only(left: 20, bottom: 40),
                    child: Row(
                      children: [
                        Container(child:Image.asset('assets/images/settings/shield.png',color: Colors.grey,)),
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
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
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
                    margin: EdgeInsets.only(left: 20, bottom: 40),
                    child: Row(
                      children: [
                        Container(child:Image.asset('assets/images/settings/server.png',)),
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
    // flutter defined function
    List<String> days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
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
              return Container(
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0)),
                  color: Color(0xffEDF7FF),
                ),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin: EdgeInsets.only(top: 40, left: 10, right: 10),
                  child: Center(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 100,
                              childAspectRatio: 20 / 10,
                              crossAxisSpacing: 18,
                              mainAxisSpacing: 20),
                      itemCount: days.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.find<GetMedicineController>()
                                .changeFristDayOfWeek(days[index]);
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                const Radius.circular(5.0),
                              ),
                              /* color: getvitalController.firstDayOfWeek ==
                                      days[index]
                                  ? kPrimaryColor
                                  : Colors.white, */
                            ),
                            height: 10,
                            width: 50,
                            child: Card(
                              color: getvitalController.firstDayOfWeek ==
                                      days[index]
                                  ? kPrimaryColor
                                  : Colors.white,
                              child: Center(
                                child: Text(
                                  days[index],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          getvitalController.firstDayOfWeek ==
                                                  days[index]
                                              ? Colors.white
                                              : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  void _showBottomDialog() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return GetBuilder<GetMedicineController>(
            init: GetMedicineController(),
            builder: (getvitalController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    topRight: const Radius.circular(30.0),
                    topLeft: const Radius.circular(30.0),
                  ),
                  color: Color(0xffEDF7FF), /* Color(0xffEDF7FF), */
                ),
                height: 230,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              
                              });
                            },
                            child: Container(
                              // margin: EdgeInsets.only(left: 20),
                              height: 70,
                              width: 70,
                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(70),
                                ),
                              ),
                              child: Center(
                                  child: Image.asset(
                                'assets/images/shareapp/fb.png',
                                height: 40,
                              )),
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
                              
                              });
                            },
                            child: Container(
                              // margin: EdgeInsets.only(left: 20),
                              height: 70,
                              width: 70,
                              // padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(70),
                                ),
                              ),
                              child: Center(
                                  child: Image.asset(
                                'assets/images/shareapp/instagram.png',
                                height: 40,
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              SocialShare.shareWhatsapp(
                                "Struggling to keep track of your daily medications? Download the app now:link\n https://google.com",
                              ).then((data) {
                               
                              });
                            },
                            child: Container(
                              // margin: EdgeInsets.only(left: 20),
                              height: 70,
                              width: 70,
                              // padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(70),
                                ),
                              ),
                              child: Center(
                                  child: Image.asset(
                                'assets/images/shareapp/whatsapp.png',
                                height: 40,
                              )),
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async {
                              File file = await getImageFileFromAssets(
                                  'images/no_vital.png');
                              SocialShare.shareTwitter(
                                "Struggling to keep track of your daily medications? Download the app now",
                                hashtags: ["hello", "world", "foo", "bar"],
                                url: "https://google.com/#/hello",
                                trailingText: "\nhello",
                              ).then((data) {
                                
                              });
                            },
                            child: Container(
                              // margin: EdgeInsets.only(left: 20),
                              height: 70,
                              width: 70,
                              padding: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(70),
                                ),
                              ),
                              child: Center(
                                  child: Image.asset(
                                'assets/images/shareapp/twitter.png',
                                height: 40,
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              SocialShare.shareSms(
                                "Struggling to keep track of your daily medications? Download the app now",
                                url: "\nhttps://google.com/",
                                trailingText: "\nhello",
                              ).then((data) {
                               
                              });
                            },
                            child: Container(
                              // margin: EdgeInsets.only(left: 20),
                              height: 70,
                              width: 70,
                              padding: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(70),
                                ),
                              ),
                              child: Center(
                                  child: Image.asset(
                                'assets/images/shareapp/sms.png',
                                height: 40,
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              SocialShare.copyToClipboard(
                                "This is Social Share plugin",
                              ).then((data) {
                              
                              });
                            },
                            child: Container(
                              // margin: EdgeInsets.only(left: 20),
                              height: 70,
                              width: 70,
                              // padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(70),
                                ),
                              ),
                              child: Center(
                                  child: Image.asset(
                                'assets/images/shareapp/link.png',
                                height: 30,
                              )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
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

  
} */
}
