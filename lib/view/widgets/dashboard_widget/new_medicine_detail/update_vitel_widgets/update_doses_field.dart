import 'package:Vitel/controller/add_medicine/add_medicine_controller.dart';
import 'package:Vitel/main.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UpdateDosageField extends StatefulWidget {
  double dosageGap;
  Vitel vitel;
  UpdateDosageField({required this.dosageGap, required this.vitel});
  @override
  _UpdateDosageFieldState createState() => _UpdateDosageFieldState();
}

Color offColor = Color(0xFFC4C4C4);

class _UpdateDosageFieldState extends State<UpdateDosageField> {
  int dosageNumber = 0;
  String time_1 = '1st Dose';
  String time_2 = '2nd Dose';
  String time_3 = '3rd Dose';
  String time_4 = '4th Dose';
  String time_5 = '5th Dose';
  String time_6 = '6th Dose';
  AddMedicineController addmedicineController = Get.put(AddMedicineController());

  @override
  void initState() {
    if (widget.vitel.doseSix.isNotEmpty) {
      dosageNumber = 6;
    } else if (widget.vitel.doseFive.isNotEmpty) {
      dosageNumber = 5;
    } else if (widget.vitel.doseFour.isNotEmpty) {
      dosageNumber = 4;
    } else if (widget.vitel.doseThree.isNotEmpty) {
      dosageNumber = 3;
    } else if (widget.vitel.doseTwo.isNotEmpty) {
      dosageNumber = 2;
    } else if (widget.vitel.doseOne.isNotEmpty) {
      dosageNumber = 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Vitel vitel = widget.vitel;

    return Container(
      margin: EdgeInsets.only(left: 40, top: 10),
      child: Column(children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    dosageNumber = 1;
                    vitel.doseSix = '';
                    vitel.doseFive = '';
                    vitel.doseFour = '';
                    vitel.doseThree = '';
                    vitel.doseTwo = '';
                  });
                },
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: dosageNumber == 1 ? kPrimaryColor : offColor,
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
                    vitel.doseSix = '';
                    vitel.doseFive = '';
                    vitel.doseFour = '';
                    vitel.doseThree = '';
                  });
                },
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: dosageNumber == 2 ? kPrimaryColor : offColor,
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
                    vitel.doseSix = '';
                    vitel.doseFive = '';
                    vitel.doseFour = '';
                  });
                },
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: dosageNumber == 3 ? kPrimaryColor : offColor,
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
                    vitel.doseSix = '';
                    vitel.doseFive = '';
                  });
                },
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: dosageNumber == 4 ? kPrimaryColor : offColor,
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
                    vitel.doseSix = '';
                  });
                },
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: dosageNumber == 5 ? kPrimaryColor : offColor,
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
                  backgroundColor: dosageNumber == 6 ? kPrimaryColor : offColor,
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
                child: Row(children: <Widget>[
                  vitel.doseOne.isNotEmpty || dosageNumber >= 1
                      ? InkWell(
                          onTap: () {
                            FocusScopeNode currentFocus = FocusScope.of(context);

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
                            margin: EdgeInsets.only(right: widget.dosageGap),
                            child: Center(
                              child: Text(
                                vitel.doseOne.isNotEmpty ? vitel.doseOne : time_1,
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  vitel.doseTwo.isNotEmpty || dosageNumber >= 2
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
                            margin: EdgeInsets.only(right: widget.dosageGap, left: widget.dosageGap),
                            child: Center(
                              child: Text(
                                vitel.doseTwo.isNotEmpty ? vitel.doseTwo : time_2,
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  vitel.doseThree.isNotEmpty || dosageNumber >= 3
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
                            margin: EdgeInsets.only(right: widget.dosageGap, left: widget.dosageGap),
                            child: Center(
                              child: Text(
                                vitel.doseThree.isNotEmpty ? vitel.doseThree : time_3,
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    vitel.doseFour.isNotEmpty || dosageNumber >= 4
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
                              margin: EdgeInsets.only(right: widget.dosageGap, bottom: 7),
                              child: Center(
                                child: Text(
                                  vitel.doseFour.isNotEmpty ? vitel.doseFour : time_4,
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    vitel.doseFive.isNotEmpty || dosageNumber >= 5
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
                              margin: EdgeInsets.only(right: widget.dosageGap, left: widget.dosageGap, bottom: 7),
                              child: Center(
                                child: Text(
                                  vitel.doseFive.isNotEmpty ? vitel.doseFive : time_5,
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    vitel.doseSix.isNotEmpty || dosageNumber == 6
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
                              margin: EdgeInsets.only(right: widget.dosageGap, left: widget.dosageGap, bottom: 7),
                              child: Center(
                                child: Text(
                                  vitel.doseSix.isNotEmpty ? vitel.doseSix : time_6,
                                  style: TextStyle(fontSize: 14, color: Colors.white),
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
      ]),
    );
  }

  void _showDialog(String doseName) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Dialog(
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
                            style: TextStyle(color: kPrimaryColor, fontSize: 16, fontWeight: FontWeight.w500),
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
      highlightedTextStyle: TextStyle(fontSize: 42, color: Colors.white, fontWeight: FontWeight.w800),
      normalTextStyle: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.w800),
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
