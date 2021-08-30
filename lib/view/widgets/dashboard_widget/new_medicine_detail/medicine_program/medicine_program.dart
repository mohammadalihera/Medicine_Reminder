import 'package:MedicineReminder/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class MedicinePrograme extends StatefulWidget {
  @override
  _MedicineProgrameState createState() => _MedicineProgrameState();
}

class _MedicineProgrameState extends State<MedicinePrograme> {
  int selectedDays = 0;
  int _currentIntValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 40, top: 0),
              child: Text(
                'Program',
                style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: _showDialog,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Text(
                        selectedDays == 0
                            ? 'How Many Days?'
                            : selectedDays.toString(),
                        style: TextStyle(
                            color:
                                selectedDays == 0 ? Colors.grey : Colors.black,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 30, top: 10),
                      height: 1.3,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            )
          ]),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.only(top: 20, right: 15),
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(
                const Radius.circular(50.0),
              ),
              color: kPrimaryColor,
            ),
            height: 250,
            width: 300,
            child: Center(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 87,
                    bottom: 45,
                    child: Container(
                        color: kPrimaryColor,
                        height: 180,
                        width: 100,
                        child: CupertinoPicker(
                            useMagnifier: false,
                            selectionOverlay: null,
                            looping: false,
                            itemExtent: 100,
                            scrollController: FixedExtentScrollController(),
                            onSelectedItemChanged: (int index) {
                              print(index);
                              setState(() {
                                selectedDays = index;
                              });
                            },
                            children: [
                              for (int i = 0; i <= 100; i++)
                                Center(
                                  child: Container(
                                    height: 50,
                                    color: kPrimaryColor,
                                    child: Text(
                                      i.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 50,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                            ])),
                  ),
                  Positioned(
                    top: 80,
                    left: 28,
                    child: Container(
                      child: Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      right: 15,
                      child: Container(
                        child: Center(
                          child: Text(
                            'Days',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                  Positioned(
                    bottom: 20,
                    left: 65,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            'Set Program',
                            style: TextStyle(
                                fontSize: 16,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  /* Positioned(
                    top: 5,
                    right: 12,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedDays = 0;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                  ) */
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
