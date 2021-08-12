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
              margin: EdgeInsets.only(left: 40, top: 12),
              child: Text(
                'Program',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
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
                         selectedDays==0? 'Ex 30':selectedDays.toString(),
                          style: TextStyle(color:selectedDays==0? Colors.grey:Colors.black,fontSize: 16),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 30),
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
              color: Colors.blue,
            ),
            height: 280,
            width: 300,
            child: Stack(children: <Widget>[
              Positioned(
                left: 90,
                bottom: 70,
                child: Container(
                    color: Colors.blue,
                    height: 180,
                    width: 100,
                    child: CupertinoPicker(
                      useMagnifier: false,
                      looping: true,
                      
                        itemExtent: 100,
                        diameterRatio: 2,
                        onSelectedItemChanged: (int index) {
                          print(index);
                          setState(() {
                            selectedDays=index;
                          });
                        },
                        children: [
                          for (int i = 0; i <= 100; i++)
                            Container(
                              color: Colors.blue,
                              child: Center(
                                child: Text(i.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.w600)),
                              ),
                            )
                        ])),
              ),
              Positioned(
                top: 80,
                left: 30,
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
                  left: 190,
                  child: Container(
                    child: Text(
                      'Days',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
              Positioned(
              bottom:20,
                  left: 70,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                                      child: Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                           'Set Programs',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ))
            ]),
          ),
        );
      },
    );
  }

}
