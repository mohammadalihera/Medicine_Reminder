
import 'package:flutter/material.dart';

import '../../../main.dart';

class NextWeekMedicine extends StatefulWidget {
  const NextWeekMedicine({Key? key}) : super(key: key);

  @override
  _NextWeekMedicineState createState() => _NextWeekMedicineState();
}

class _NextWeekMedicineState extends State<NextWeekMedicine> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, right: 20),
              child: Icon(
                Icons.keyboard_arrow_left_sharp,
                color: kPrimaryColor,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        margin: EdgeInsets.only(right: 35),
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
                            width: 70,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    '21',
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
                      Container(
                        margin: EdgeInsets.only(right: 35),
                        child: Center(
                          child: Text(
                            'Napa',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        margin: EdgeInsets.only(right: 35),
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
                            width: 70,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    '07',
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
                      Container(
                        margin: EdgeInsets.only(right: 35),
                        child: Center(
                          child: Text(
                            'Indomnate',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        margin: EdgeInsets.only(right: 35),
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
                            width: 70,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    '17',
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
                      Container(
                        margin: EdgeInsets.only(right: 35),
                        child: Center(
                          child: Text(
                            'Max Pro',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        margin: EdgeInsets.only(right: 35),
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
                            width: 70,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    '14',
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
                      Container(
                        margin: EdgeInsets.only(right: 35),
                        child: Center(
                          child: Text(
                            'Paracetamol',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Icon(
                Icons.keyboard_arrow_right_sharp,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
