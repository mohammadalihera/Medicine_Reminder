import 'package:MedicineReminder/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicineQuantity extends StatefulWidget {
  @override
  _MedicineQuantityState createState() => _MedicineQuantityState();
}

class _MedicineQuantityState extends State<MedicineQuantity> {
  int selectedQuantity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 40, top: 12),
              child: Text(
                'Quantity',
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
                          selectedQuantity == 0
                              ? 'Ex. 30'
                              : selectedQuantity.toString(),
                          style: TextStyle(
                              color: selectedQuantity == 0
                                  ? Colors.grey
                                  : Colors.black,
                              fontSize: 16),
                        )),
                    Container(
                      margin: EdgeInsets.only(
                        left: 40,
                        right: 30,
                        top: 10,
                      ),
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
            height: 280,
            width: 300,
            child: Stack(children: <Widget>[
              Positioned(
                left: 90,
                bottom: 70,
                child: Container(
                    color: kPrimaryColor,
                    height: 180,
                    width: 100,
                    child: CupertinoPicker(
                        itemExtent: 100,
                        looping: false,
                        useMagnifier: false,
                        selectionOverlay: null,
                        onSelectedItemChanged: (int index) {
                          print(index);
                          setState(() {
                            selectedQuantity = index;
                          });
                        },
                        children: [
                          for (int i = 0; i <= 100; i++)
                            Container(
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
                      'Pieces',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
              Positioned(
                bottom: 20,
                left: 70,
                child: InkWell(
                  onTap: () {
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
                        'Set Quantity',
                        style: TextStyle(
                            fontSize: 16,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 10,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedQuantity = 0;
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
