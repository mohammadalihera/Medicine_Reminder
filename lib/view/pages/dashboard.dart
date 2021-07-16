import 'package:MedicineReminder/view/widgets/dashboard_widget/calendar.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/dashboard_appbar.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/medicine_detail/medicine_detail.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/medicine_info_tile.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/new_medicine_detail/new_medicine_detail.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/user_image_name.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(60), //set from design
      //   child: DashBoardAppbar(),
      // ),
      backgroundColor: Color(0xffE5E5E5),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50),
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Column(
                  children: <Widget>[
                    // Container(
                    //   margin: EdgeInsets.only(left: 10, top: 40),
                    //   child: Icon(
                    //     Icons.menu,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    UserNameImage(),
                    CustomCalendar('week'),
                  ],
                ),
              ),
              InkWell(
                onTap:medicineDetail ,
                child: MedicineInfoTile(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addMedicine,
        tooltip: 'Increment',
        child: Icon(Icons.add),
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
            height: MediaQuery.of(context).size.height * 0.78,
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
