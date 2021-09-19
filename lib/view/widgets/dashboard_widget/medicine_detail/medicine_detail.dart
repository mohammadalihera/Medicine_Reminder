import 'package:Vitals/model/medicine_model.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/meal/after_meal.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/meal/before_meal.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/medicine_info_text_field.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/new_medicine_detail.dart';
import 'package:flutter/material.dart';

class MedicineDetail extends StatefulWidget {
  final Vital vital;
  MedicineDetail(this.vital);
  @override
  _MedicineDetailState createState() => _MedicineDetailState();
}

class _MedicineDetailState extends State<MedicineDetail> {
  int dose = 3;
  TextEditingController editingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  child: Text(widget.vital.name,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                SizedBox(height: 5),
              widget.vital.afterMeal==1?  AfterMeal('after', 'other'):BeforeMeal('before', 'other')
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
                                  widget.vital.doseOne.isNotEmpty
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
                                                widget.vital.doseOne,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  widget.vital.doseTwo.isNotEmpty
                                      ? InkWell(
                                          onTap: () {
                                            // _showDialog( 'dose2');
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
                                                'dose time',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  widget.vital.doseThree.isNotEmpty
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
                                                'dose time',
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
                                  widget.vital.doseFour.isNotEmpty
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
                                                'dose time',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                 widget.vital.doseFive.isNotEmpty
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
                                                'dose time',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  widget.vital.doseSix.isNotEmpty
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
                                                'dose time',
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
                                'Total '+widget.vital.program.toString() +' Days ' + '|' + " ",
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
                                'Total '+widget.vital.quantity.toString()+' Pills ' + '|' + " ",
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
                    onTap: null,
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
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.78,
            decoration: new BoxDecoration(
              color: Color(0xffEDF7FF),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(35.0),
                topRight: const Radius.circular(35.0),
              ),
            ),
            child: NewMedicineDetail(),
          );
        });
  }
}
