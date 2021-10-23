import 'package:Vitals/controller/add_medicine/add_medicine_controller.dart';
import 'package:Vitals/main.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/dosage_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MedicineDosageField extends StatefulWidget {
  double dosageGap;
  MedicineDosageField({required this.dosageGap});
  @override
  _MedicineDosageFieldState createState() => _MedicineDosageFieldState();
}

Color offColor = Color(0xFFC4C4C4);

class _MedicineDosageFieldState extends State<MedicineDosageField> {
  int dosageNumber = 0;
  DateTime dose_1 = DateTime.now();
  DateTime dose_2 = DateTime.now();
  DateTime dose_3 = DateTime.now();
  DateTime dose_4 = DateTime.now();
  DateTime dose_5 = DateTime.now();
  DateTime dose_6 = DateTime.now();
  String time_1 = '1st Dose';
  String time_2 = '2nd Dose';
  String time_3 = '3rd Dose';
  String time_4 = '4th Dose';
  String time_5 = '5th Dose';
  String time_6 = '6th Dose';
  DateTime _dateTime = DateTime.now();
  AddMedicineController addmedicineController =
      Get.put(AddMedicineController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40, top: 10),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      dosageNumber = 1;
                    });
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        dosageNumber == 1 ? kPrimaryColor : offColor,
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      dosageNumber = 2;
                    });
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        dosageNumber == 2 ? kPrimaryColor : offColor,
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      dosageNumber = 3;
                    });
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        dosageNumber == 3 ? kPrimaryColor : offColor,
                    child: Center(
                      child: Text(
                        '3',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      dosageNumber = 4;
                    });
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        dosageNumber == 4 ? kPrimaryColor : offColor,
                    child: Center(
                      child: Text(
                        '4',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      dosageNumber = 5;
                    });
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        dosageNumber == 5 ? kPrimaryColor : offColor,
                    child: Center(
                      child: Text(
                        '5',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      dosageNumber = 6;
                    });
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        dosageNumber == 6 ? kPrimaryColor : offColor,
                    child: Center(
                      child: Text(
                        '6',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      dosageNumber >= 1
                          ? InkWell(
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                _showDialog('dose1');
                              },
                              child: Container(
                                width: 95,
                                height: 22,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                  color: kPrimaryColor,
                                ),
                                margin:
                                    EdgeInsets.only(right: widget.dosageGap),
                                child: Center(
                                  child: Text(
                                    time_1,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      dosageNumber >= 2
                          ? InkWell(
                              onTap: () {
                                _showDialog('dose2');
                              },
                              child: Container(
                                width: 95,
                                height: 22,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                  color: kPrimaryColor,
                                ),
                                margin: EdgeInsets.only(
                                    right: widget.dosageGap,
                                    left: widget.dosageGap),
                                child: Center(
                                  child: Text(
                                    time_2,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      dosageNumber >= 3
                          ? InkWell(
                              onTap: () {
                                _showDialog('dose3');
                              },
                              child: Container(
                                width: 95,
                                height: 22,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                  color: kPrimaryColor,
                                ),
                                margin: EdgeInsets.only(
                                    right: widget.dosageGap,
                                    left: widget.dosageGap),
                                child: Center(
                                  child: Text(
                                    time_3,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      dosageNumber >= 4
                          ? InkWell(
                              onTap: () {
                                _showDialog('dose4');
                              },
                              child: Container(
                                width: 95,
                                height: 22,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                  color: kPrimaryColor,
                                ),
                                margin: EdgeInsets.only(
                                    right: widget.dosageGap, bottom: 7),
                                child: Center(
                                  child: Text(
                                    time_4,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      dosageNumber >= 5
                          ? InkWell(
                              onTap: () {
                                _showDialog('dose5');
                              },
                              child: Container(
                                width: 95,
                                height: 22,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                  color: kPrimaryColor,
                                ),
                                margin: EdgeInsets.only(
                                    right: widget.dosageGap,
                                    left: widget.dosageGap,
                                    bottom: 7),
                                child: Center(
                                  child: Text(
                                    time_5,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      dosageNumber == 6
                          ? InkWell(
                              onTap: () {
                                _showDialog('dose6');
                              },
                              child: Container(
                                width: 95,
                                height: 22,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                  color: kPrimaryColor,
                                ),
                                margin: EdgeInsets.only(
                                    right: widget.dosageGap,
                                    left: widget.dosageGap,
                                    bottom: 7),
                                child: Center(
                                  child: Text(
                                    time_6,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showDialog(String doseName) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.only(top: 40, right: 15),
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(
                const Radius.circular(50.0),
              ),
              color: kPrimaryColor,
            ),
            height: 250,
            width: 25,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                hourMinute12H(doseName),
                Positioned(
                    bottom: 36,
                    left: 20,
                    child: Container(
                      height: 50,
                      width: 230,
                      color: kPrimaryColor.withOpacity(0.8),
                    )),
                Positioned(
                    bottom: 52,
                    left: 20,
                    child: Container(
                      height: 50,
                      width: 230,
                      color: kPrimaryColor.withOpacity(0.4),
                    )),
                Positioned(
                    bottom: 175,
                    left: 20,
                    child: Container(
                      height: 50,
                      width: 230,
                      color: kPrimaryColor.withOpacity(0.8),
                    )),
                Positioned(
                    bottom: 170,
                    left: 20,
                    child: Container(
                      height: 50,
                      width: 230,
                      color: kPrimaryColor.withOpacity(0.4),
                    )),
                Positioned(
                  left: 62,
                  bottom: 25,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Color(0xffEDF7FF),
                      ),
                      child: Center(
                        child: Text(
                          'Set Dose',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -20,
                  right: 5,
                  child: Container(
                    color: kPrimaryColor,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget hourMinute12H(String doseName) {
    return new TimePickerSpinner(
      itemHeight: 50,
      itemWidth: 60,
      spacing: 5.0,
      isForce2Digits: true,
      is24HourMode: false,
      highlightedTextStyle: TextStyle(
          fontSize: 42, color: Colors.white, fontWeight: FontWeight.w800),
      normalTextStyle: TextStyle(
          color: Colors.white, fontSize: 42, fontWeight: FontWeight.w800),
      onTimeChange: (time) {
        if (doseName == 'dose1') {
          setState(() {
            dose_1 = time;
            time_1 = DateFormat('hh:mm a').format(time);
          });
          Get.find<AddMedicineController>().changeDone(time_1);
        } else if (doseName == 'dose2') {
          setState(() {
            dose_2 = time;
            time_2 = DateFormat('hh:mm a').format(time);
          });
          Get.find<AddMedicineController>().changeDtwo(time_2);
        } else if (doseName == 'dose3') {
          setState(() {
            dose_3 = time;
            time_3 = DateFormat('hh:mm a').format(time);
          });
          Get.find<AddMedicineController>().changeDthree(time_3);
        } else if (doseName == 'dose4') {
          setState(() {
            dose_4 = time;
            time_4 = DateFormat('hh:mm a').format(time);
          });
          Get.find<AddMedicineController>().changeDfour(time_4);
        } else if (doseName == 'dose5') {
          setState(() {
            dose_5 = time;
            time_5 = DateFormat('hh:mm a').format(time);
          });
          Get.find<AddMedicineController>().changeDfive(time_5);
        } else if (doseName == 'dose6') {
          setState(() {
            dose_6 = time;
            time_6 = DateFormat('hh:mm a').format(time);
          });
          Get.find<AddMedicineController>().changeDsix(time_6);
        }
      },
    );
  }
}
