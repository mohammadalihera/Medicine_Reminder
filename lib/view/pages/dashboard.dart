import 'package:MedicineReminder/view/widgets/dashboard_widget/calendar.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/dashboard_appbar.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/medicine_detail/medicine_detail.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/medicine_info_tile.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/new_medicine_detail/new_medicine_detail.dart';

import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  int currentIndex;
  DashBoard(this.currentIndex);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:  Colors.blue,
      body: Container(
      // color:   Color(0xffEDF7FF),
        padding: EdgeInsets.only(bottom:50),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50,bottom: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Column(
                  children: <Widget>[
                    CustomCalendar('week'),
                  ],
                ),
              ),
             // SizedBox(height:10),
              InkWell(
                onTap: medicineDetail,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color:  Color(0xffEDF7FF),
                  ),
                  child: MedicineInfoTile(),
                ),
              ),
              
            ],
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

  void medicineDetail() {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.78,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(35.0),
                topRight: const Radius.circular(35.0),
              ),
            ),
            child: MedicineDetail(),
          );
        });
  }
}
