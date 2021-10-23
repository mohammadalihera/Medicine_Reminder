import 'package:Vitals/controller/auth_user_controller.dart';
import 'package:Vitals/controller/get_medicine/get_medicine.dart';
import 'package:Vitals/main.dart';
import 'package:Vitals/view/widgets/dashboard_widget/calendar.dart';
import 'package:Vitals/view/widgets/dashboard_widget/dashboard_appbar.dart';
import 'package:Vitals/view/widgets/dashboard_widget/medicine_detail/medicine_detail.dart';
import 'package:Vitals/view/widgets/dashboard_widget/medicine_info_tile.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/new_medicine_detail.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

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
              child: Text('Welcome, ' + headerTitle),
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
                    builder: (vitalController) {
                      return vitalController.selectedVital.length > 0
                          ? Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      vitalController.selectedVital.length < 3
                                          ? 300
                                          : 100),
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
                                  Image.asset('assets/images/no_vital.png'),
                                  SizedBox(
                                    height: 30,
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
      /* floatingActionButton: FloatingActionButton(
        onPressed: addMedicine,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), */
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

/*   void medicineDetail() {
    double modalHeight = 0;
    if (displayHeight < 750) {
      modalHeight = MediaQuery.of(context).size.height * 0.8;
    }
    if (displayHeight >= 750) {
      modalHeight = modalHeight = MediaQuery.of(context).size.height * 0.72;
    }
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: modalHeight,
            decoration: new BoxDecoration(
              color: Color(0xffEDF7FF),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(35.0),
                topRight: const Radius.circular(35.0),
              ),
            ),
            child: MedicineDetail(vital),
          );
        });
  } */
}
