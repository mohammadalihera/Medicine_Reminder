import 'package:Vitel/controller/auth_user_controller.dart';
import 'package:Vitel/controller/get_medicine/get_medicine.dart';
import 'package:Vitel/database/caching/cache.dart';
import 'package:Vitel/main.dart';
import 'package:Vitel/view/widgets/dashboard_widget/calendar.dart';
import 'package:Vitel/view/widgets/dashboard_widget/medicine_info_tile.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/new_medicine_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatefulWidget {
  int currentIndex;
  DashBoard(this.currentIndex);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  AuthUserController authUserController = Get.put(AuthUserController());
  double displayHeight = 0;

  @override
  Widget build(BuildContext context) {
    displayHeight = MediaQuery.of(context).size.height;
    String headerTitle;
    CacheService.instance.initSkipLoginHive();

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: GetBuilder<AuthUserController>(
          init: AuthUserController(),
          builder: (authController) {
            if (authController.userName != '' && authController.userPhone == '') {
              headerTitle = authController.userName;
            } else {
              headerTitle = authController.userPhone;
            }
            return Center(
              child: CacheService.instance.skipLogin.get('skipLogin').toString().isEmpty ? Text('Welcome, ' + headerTitle) : Text('Welcome'),
            );
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: GetBuilder<GetMedicineController>(
            init: GetMedicineController(),
            builder: (refreshTabController) {
              return Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 0, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: CustomCalendar('week'),
                  ),
                  GetBuilder<GetMedicineController>(
                    init: GetMedicineController(),
                    builder: (vitelController) {
                      return vitelController.selectedVitel.length > 0
                          ? Container(
                              padding: EdgeInsets.only(bottom: vitelController.selectedVitel.length < 3 ? 300 : 100),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                color: Color(0xffEDF7FF),
                              ),
                              child: MedicineInfoTile(),
                            )
                          : Container(
                              height: MediaQuery.of(context).size.height - 280,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                color: Color(0xffEDF7FF),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    'assets/images/no_vital.png',
                                    height: 200,
                                    width: 200,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'No Medicine Added Today',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void addMedicine() {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.82,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(35.0),
                topRight: const Radius.circular(35.0),
              ),
            ),
            child: NewMedicineDetail(),
          );
        });
  }
}
