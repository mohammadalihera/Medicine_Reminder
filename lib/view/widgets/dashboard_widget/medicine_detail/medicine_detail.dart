import 'package:Vitel/controller/get_medicine/get_medicine.dart';
import 'package:Vitel/database/vitel_reprository.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/meal/after_meal.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/meal/before_meal.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/medicine_info_text_field.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/new_medicine_detail.dart';
import 'package:Vitel/view/widgets/dashboard_widget/medicine_detail/update_medicine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicineDetail extends StatefulWidget {
  final Vitel vitel;
  MedicineDetail(this.vitel);
  @override
  _MedicineDetailState createState() => _MedicineDetailState();
}

class _MedicineDetailState extends State<MedicineDetail> {
   late double displayHeight;
  int dose = 3;
  TextEditingController editingController = new TextEditingController();
  GetMedicineController getmedicineController =
      Get.put(GetMedicineController());
  @override
  Widget build(BuildContext context) {
    displayHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: size.width,
            margin: EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Text(
                  'Pill Name',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )),
                Container(
                  child: Text(widget.vitel.name,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                SizedBox(height: 5),
                widget.vitel.afterMeal == 1
                    ? AfterMeal('after', 'other')
                    : BeforeMeal('before', 'other')
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 40, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dose',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 5),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  widget.vitel.doseOne.isNotEmpty
                                      ? InkWell(
                                          onTap: () {
                                            //_showDialog('dose1');
                                          },
                                          child: Container(
                                            width: 95,
                                            height: 22,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  new BorderRadius.all(
                                                const Radius.circular(5.0),
                                              ),
                                              color: Colors.blue,
                                            ),
                                            margin: EdgeInsets.only(right: 5),
                                            child: Center(
                                              child: Text(
                                                widget.vitel.doseOne,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  widget.vitel.doseTwo.isNotEmpty
                                      ? InkWell(
                                          onTap: () {
                                            
                                          },
                                          child: Container(
                                            width: 95,
                                            height: 22,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  new BorderRadius.all(
                                                const Radius.circular(5.0),
                                              ),
                                              color: Colors.blue,
                                            ),
                                            margin: EdgeInsets.only(right: 5),
                                            child: Center(
                                              child: Text(
                                                widget.vitel.doseTwo,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  widget.vitel.doseThree.isNotEmpty
                                      ? InkWell(
                                          onTap: () {
                                            //_showDialog('dose3');
                                          },
                                          child: Container(
                                            width: 95,
                                            height: 22,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  new BorderRadius.all(
                                                const Radius.circular(5.0),
                                              ),
                                              color: Colors.blue,
                                            ),
                                            margin: EdgeInsets.only(right: 5),
                                            child: Center(
                                              child: Text(
                                                widget.vitel.doseThree,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
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
                                  widget.vitel.doseFour.isNotEmpty
                                      ? InkWell(
                                          onTap: () {
                                            // _showDialog('dose4');
                                          },
                                          child: Container(
                                            width: 95,
                                            height: 22,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  new BorderRadius.all(
                                                const Radius.circular(5.0),
                                              ),
                                              color: Colors.blue,
                                            ),
                                            margin: EdgeInsets.only(right: 5),
                                            child: Center(
                                              child: Text(
                                                widget.vitel.doseFour,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  widget.vitel.doseFive.isNotEmpty
                                      ? InkWell(
                                          onTap: () {
                                            //_showDialog('dose5');
                                          },
                                          child: Container(
                                            width: 95,
                                            height: 22,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  new BorderRadius.all(
                                                const Radius.circular(5.0),
                                              ),
                                              color: Colors.blue,
                                            ),
                                            margin: EdgeInsets.only(right: 5),
                                            child: Center(
                                              child: Text(
                                                widget.vitel.doseFive,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  widget.vitel.doseSix.isNotEmpty
                                      ? InkWell(
                                          onTap: () {
                                            //_showDialog('dose6');
                                          },
                                          child: Container(
                                            width: 95,
                                            height: 22,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  new BorderRadius.all(
                                                const Radius.circular(5.0),
                                              ),
                                              color: Colors.blue,
                                            ),
                                            margin: EdgeInsets.only(right: 5),
                                            child: Center(
                                              child: Text(
                                                widget.vitel.doseSix,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
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
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Program',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'Total ' +
                                    widget.vitel.program.toString() +
                                    ' Days ' +
                                    '|' +
                                    " ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              child: Text(
                                '_ Days Left',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Quantity',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                'Total ' +
                                    widget.vitel.quantity.toString() +
                                    ' Pills ' +
                                    '|' +
                                    " ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              child: Text(
                                '_ Pills Left',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: InkWell(
                    onTap: () {
                      /* await Repository.deleteData('vitels', widget.vitel.id);
                      getmedicineController.getAllvitelFromDb();
                      Navigator.pop(context); */
                      Navigator.pop(context);
                      deletAlert(widget.vitel, context);
                    },
                    child: Container(
                      width: 115,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          'Delete',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 27),
                Center(
                  child: InkWell(
                    onTap: addMedicine,
                    child: Container(
                      width: size.width * .7,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          'Edit Schedule',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void addMedicine() {

    late double modalHeight;
    if (displayHeight < 700) {
      modalHeight = MediaQuery.of(context).size.height * 0.9;
    }
    if (displayHeight > 700 && displayHeight < 750) {
      modalHeight = modalHeight = MediaQuery.of(context).size.height * 0.87;
      //modalHeight = modalHeight = MediaQuery.of(context).size.height * 0.7;
    }
    if (displayHeight > 750) {
      modalHeight = modalHeight = MediaQuery.of(context).size.height * 0.75;
      //modalHeight = modalHeight = MediaQuery.of(context).size.height * 0.7;
      // responsive modal implementation
    }
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: modalHeight,
            decoration: new BoxDecoration(
              color: Color(0xffEDF7FF),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(35.0),
                topRight: const Radius.circular(35.0),
              ),
            ),
            child: UpdateMedicineDetail(widget.vitel),
          );
        });
         
  }

  void deletAlert(Vitel vitel, context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Text('Delete', style: TextStyle(color: Colors.red)),
              SizedBox(
                width: 10,
              ),
              Text(vitel.name),
            ],
          ),
          content: Text("Do you want to delte" + ' ' + vitel.name),
          actions: [
            Card(
              color: Colors.green,
              child: Container(
                width: 50,
                height: 30,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('NO', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Card(
              color: Colors.red,
              child: Container(
                width: 50,
                height: 30,
                child: Center(
                  child: InkWell(
                    onTap: () async {
                      await Repository.deleteData('Vitel', vitel.id);
                      getmedicineController.getAllVitelFromDb(context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        );
      },
    );
  }
}
