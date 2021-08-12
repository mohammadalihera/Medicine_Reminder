import 'package:MedicineReminder/view/widgets/dashboard_widget/new_medicine_detail/dosage_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';

class MedicineDosageField extends StatefulWidget {
  @override
  _MedicineDosageFieldState createState() => _MedicineDosageFieldState();
}

class _MedicineDosageFieldState extends State<MedicineDosageField> {
  int dosageNumber = 0;
  DateTime dose_1 = DateTime.now();
  DateTime dose_2 = DateTime.now();
  DateTime dose_3 = DateTime.now();
  DateTime dose_4 = DateTime.now();
  DateTime dose_5 = DateTime.now();
  DateTime dose_6 = DateTime.now();
  String time_1 = 'dose time';
  String time_2 = 'dose time';
  String time_3 = 'dose time';
  String time_4 = 'dose time';
  String time_5 = 'dose time';
  String time_6 = 'dose time';
  DateTime _dateTime = DateTime.now();
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
                        dosageNumber == 1 ? Colors.blue : Colors.grey.shade500,
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
                        dosageNumber == 2 ? Colors.blue : Colors.grey.shade500,
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
                        dosageNumber == 3 ? Colors.blue : Colors.grey.shade500,
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
                        dosageNumber == 4 ? Colors.blue : Colors.grey.shade500,
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
                        dosageNumber == 5 ? Colors.blue : Colors.grey.shade500,
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
                        dosageNumber == 6 ? Colors.blue : Colors.grey.shade500,
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
                                _showDialog('dose1');
                              },
                              child: Container(
                                width: 95,
                                height: 22,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                    const Radius.circular(5.0),
                                  ),
                                  color: Colors.blue,
                                ),
                                margin: EdgeInsets.only(right: 5),
                                child: Center(
                                  child: Text(
                                    time_1,
                                    style: TextStyle(fontSize: 14),
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
                                  color: Colors.blue,
                                ),
                                margin: EdgeInsets.only(right: 5),
                                child: Center(
                                  child: Text(
                                    time_2,
                                    style: TextStyle(fontSize: 14),
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
                                  color: Colors.blue,
                                ),
                                margin: EdgeInsets.only(right: 5),
                                child: Center(
                                  child: Text(
                                    time_3,
                                    style: TextStyle(fontSize: 14),
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
                                  color: Colors.blue,
                                ),
                                margin: EdgeInsets.only(right: 5),
                                child: Center(
                                  child: Text(
                                    time_4,
                                    style: TextStyle(fontSize: 14),
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
                                  color: Colors.blue,
                                ),
                                margin: EdgeInsets.only(right: 5),
                                child: Center(
                                  child: Text(
                                    time_5,
                                    style: TextStyle(fontSize: 14),
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
                                  color: Colors.blue,
                                ),
                                margin: EdgeInsets.only(right: 5),
                                child: Center(
                                  child: Text(
                                    time_6,
                                    style: TextStyle(fontSize: 14),
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
              color: Colors.blue,
            ),
            height: 250,
            width: 25,
            child: Stack(children: <Widget>[
              hourMinute12H(doseName),
              Positioned(
                  bottom: 36,
                  left: 20,
                  child: Container(
                    height: 50,
                    width: 230,
                    color: Colors.blue.withOpacity(0.8),
                  )),
              Positioned(
                  bottom: 52,
                  left: 20,
                  child: Container(
                    height: 50,
                    width: 230,
                    color: Colors.blue.withOpacity(0.4),
                  )),
              Positioned(
                  bottom: 175,
                  left: 20,
                  child: Container(
                    height: 50,
                    width: 230,
                    color: Colors.blue.withOpacity(0.8),
                  )),
              Positioned(
                  bottom: 170,
                  left: 20,
                  child: Container(
                    height: 50,
                    width: 230,
                    color: Colors.blue.withOpacity(0.4),
                  )),
              //hourMinute12HCustomStyle()
              //hourMinuteSecond()
              Positioned(
                left:62,
                bottom: 25,
                child: InkWell(
                  onTap: null,
                                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color:Color(0xffEDF7FF),
                    ),
                    child: Center(
                      child: Text(
                        'Set Dose',
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
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
        } else if (doseName == 'dose2') {
          setState(() {
            dose_2 = time;
            time_2 = DateFormat('hh:mm a').format(time);
          });
        } else if (doseName == 'dose3') {
          setState(() {
            dose_3 = time;
            time_3 = DateFormat('hh:mm a').format(time);
          });
        } else if (doseName == 'dose4') {
          setState(() {
            dose_4 = time;
            time_4 = DateFormat('hh:mm a').format(time);
          });
        } else if (doseName == 'dose5') {
          setState(() {
            dose_5 = time;
            time_5 = DateFormat('hh:mm a').format(time);
          });
        } else if (doseName == 'dose6') {
          setState(() {
            dose_6 = time;
            time_6 = DateFormat('hh:mm a').format(time);
          });
        }
      },
    );
  }
}
