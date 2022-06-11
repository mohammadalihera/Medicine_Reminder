import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class DosageBox extends StatefulWidget {
  String dosagth;
  DosageBox(this.dosagth);

  @override
  _DosageBoxState createState() => _DosageBoxState();
}

class _DosageBoxState extends State<DosageBox> {
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showDialog,
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
            _dateTime == DateTime.now() ? widget.dosagth : _dateTime.toString(),
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }

  void _showDialog() {
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
                color: Colors.blue,
              ),
              height: 250,
              width: 25,
              child: Stack(children: <Widget>[
                hourMinute12H(),
                Positioned(
                    bottom: 10,
                    left: 20,
                    child: Container(
                      height: 50,
                      width: 230,
                      color: Colors.blue.withOpacity(0.8),
                    )),
                Positioned(
                    bottom: 18,
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
              ]),
            ),
          ),
        );
      },
    );
  }

  Widget hourMinute12H() {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: new TimePickerSpinner(
        itemHeight: 60,
        itemWidth: 60,
        spacing: 5.0,
        isForce2Digits: true,
        is24HourMode: false,
        highlightedTextStyle: TextStyle(
            fontSize: 42, color: Colors.white, fontWeight: FontWeight.w800),
        normalTextStyle: TextStyle(
            color: Colors.white, fontSize: 42, fontWeight: FontWeight.w800),
        onTimeChange: (time) {
          setState(() {
            _dateTime = time;
          });
        },
      ),
    );
  }

  Widget hourMinute12HCustomStyle() {
    return new TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(fontSize: 24, color: Colors.deepOrange),
      highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.yellow),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      minutesInterval: 15,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  Widget hourMinuteSecond() {
    return new TimePickerSpinner(
      isShowSeconds: true,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}
