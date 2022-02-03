import 'package:Vitel/controller/add_medicine/add_medicine_controller.dart';
import 'package:Vitel/main.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/dosage_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UpdateDosageField extends StatefulWidget {
  double dosageGap;
  Vitel vitel;
  int preDose;
  UpdateDosageField(
      {required this.dosageGap, required this.vitel, required this.preDose});
  @override
  _UpdateDosageFieldState createState() => _UpdateDosageFieldState();
}

Color offColor = Color(0xFFC4C4C4);

class _UpdateDosageFieldState extends State<UpdateDosageField> {
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
    Vitel vital = widget.vitel;
    /* dose_1 = DateTime.parse(vital.doseOne);
    dose_2 = DateTime.parse(vital.doseTwo);
    dose_3 = DateTime.parse(vital.doseThree);
    dose_4 = DateTime.parse(vital.doseFour);
    dose_5 = DateTime.parse(vital.doseFive);
    dose_6 = DateTime.parse(vital.doseSix); */

    print('******************************************');
  

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
                      widget.preDose = 1;
                      vital.doseSix = '';
                      vital.doseFive = '';
                      vital.doseFour = '';
                      vital.doseThree = '';
                      vital.doseTwo = '';
                    });
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        widget.preDose == 1 ? kPrimaryColor : offColor,
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
                      widget.preDose = 2;
                      vital.doseSix = '';
                      vital.doseFive = '';
                      vital.doseFour = '';
                      vital.doseThree = '';
                    });
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        widget.preDose == 2 ? kPrimaryColor : offColor,
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
                      widget.preDose = 3;
                      vital.doseSix = '';
                      vital.doseFive = '';
                      vital.doseFour = '';
                    });
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        widget.preDose == 3 ? kPrimaryColor : offColor,
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
                      widget.preDose = 4;
                      vital.doseSix = '';
                      vital.doseFive = '';
                    });
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        widget.preDose == 4 ? kPrimaryColor : offColor,
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
                      widget.preDose = 5;
                      vital.doseSix = '';
                    });
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        widget.preDose == 5 ? kPrimaryColor : offColor,
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
                      widget.preDose = 6;
                    });
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        widget.preDose == 6 ? kPrimaryColor : offColor,
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
                      vital.doseOne.isNotEmpty || widget.preDose >= 1
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
                                    vital.doseOne.isNotEmpty
                                        ? vital.doseOne
                                        : time_1,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      vital.doseTwo.isNotEmpty || widget.preDose >= 2
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
                                    vital.doseTwo.isNotEmpty
                                        ? vital.doseTwo
                                        : time_2,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      vital.doseThree.isNotEmpty || widget.preDose >= 3
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
                                    vital.doseThree.isNotEmpty
                                        ? vital.doseThree
                                        : time_3,
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
                      vital.doseFour.isNotEmpty || widget.preDose >= 4
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
                                    vital.doseFour.isNotEmpty
                                        ? vital.doseFour
                                        : time_4,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      vital.doseFive.isNotEmpty || widget.preDose >= 5
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
                                    vital.doseFive.isNotEmpty
                                        ? vital.doseFive
                                        : time_5,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      vital.doseSix.isNotEmpty || widget.preDose == 6
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
                                    vital.doseSix.isNotEmpty
                                        ? vital.doseSix
                                        : time_6,
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
            time_1 = DateFormat('hh:mm a').format(time);
            widget.vitel.doseOne = time_1;
          });
          Get.find<AddMedicineController>().changeDone(time_1);
        } else if (doseName == 'dose2') {
          setState(() {
            time_2 = DateFormat('hh:mm a').format(time);
            widget.vitel.doseTwo = time_2;
          });
          Get.find<AddMedicineController>().changeDtwo(time_2);
        } else if (doseName == 'dose3') {
          setState(() {
            time_3 = DateFormat('hh:mm a').format(time);
            widget.vitel.doseThree = time_3;
          });
          Get.find<AddMedicineController>().changeDthree(time_3);
        } else if (doseName == 'dose4') {
          setState(() {
            time_4 = DateFormat('hh:mm a').format(time);
            widget.vitel.doseFour = time_4;
          });
          Get.find<AddMedicineController>().changeDfour(time_4);
        } else if (doseName == 'dose5') {
          setState(() {
            time_5 = DateFormat('hh:mm a').format(time);
            widget.vitel.doseFive = time_5;
          });
          Get.find<AddMedicineController>().changeDfive(time_5);
        } else if (doseName == 'dose6') {
          setState(() {
            time_6 = DateFormat('hh:mm a').format(time);
            widget.vitel.doseSix = time_6;
          });
          Get.find<AddMedicineController>().changeDsix(time_6);
        }
      },
    );
  }
}
