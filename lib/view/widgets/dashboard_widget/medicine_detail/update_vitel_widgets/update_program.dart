import 'package:Vitel/controller/add_medicine/add_medicine_controller.dart';
import 'package:Vitel/main.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class UpdatePrograme extends StatefulWidget {
  final Vitel vitel;
  UpdatePrograme(this.vitel);
  @override
  _UpdateProgrameState createState() => _UpdateProgrameState();
}

class _UpdateProgrameState extends State<UpdatePrograme> {
  int selectedDays = 0;
  int _currentIntValue = 0;
  AddMedicineController addmedicineController =
      Get.put(AddMedicineController());

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
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                _showDialog();
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      child: Text(
                        selectedDays == 0
                            ? widget.vitel.program.toString()
                            : selectedDays.toString(),
                        style: TextStyle(
                            color: widget.vitel.program == 0
                                ? Colors.grey
                                : Colors.black,
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
        
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(
                const Radius.circular(50.0),
              ),
              color: kPrimaryColor,
            ),
            height: 250,
            width: 280,
            child: Center(
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        color: kPrimaryColor,
                        height: 150,
                        width: 290,
                        child: CupertinoPicker(
                          useMagnifier: false,
                          selectionOverlay: null,
                          looping: true,
                          itemExtent: 100,
                          scrollController: FixedExtentScrollController(),
                          onSelectedItemChanged: (int index) {
                            setState(() {
                              selectedDays = index;
                            });
                            Get.find<AddMedicineController>()
                                .changeProgram(selectedDays);
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 105,
                    left: 32,
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
                    top: 105,
                    right: 32,
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
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 65,
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
                  Positioned(
                    top: 20,
                    right: 20,
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
