import 'package:Vitals/main.dart';
import 'package:flutter/material.dart';

class NextDoseWidget extends StatefulWidget {
  NextDoseWidget({Key? key}) : super(key: key);

  @override
  _NextDoseWidgetState createState() => _NextDoseWidgetState();
}

class _NextDoseWidgetState extends State<NextDoseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.15),
            spreadRadius: 3,
            blurRadius: 10,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: kPrimaryColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: Container(
            width: 300,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Next Dose',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '09:00' + 'AM',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 35,
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
}
