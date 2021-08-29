import 'package:MedicineReminder/main.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/new_medicine_detail/meal/after_meal.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/new_medicine_detail/meal/before_meal.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/new_medicine_detail/medicine_dosage.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/new_medicine_detail/medicine_info_text_field.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/new_medicine_detail/medicine_program/medicine_program.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/new_medicine_detail/medicine_quantity/medicine_quantity.dart';
import 'package:flutter/material.dart';

class NewMedicineDetail extends StatefulWidget {
  @override
  _NewMedicineDetailState createState() => _NewMedicineDetailState();
}

class _NewMedicineDetailState extends State<NewMedicineDetail> {
  TextEditingController editingController = new TextEditingController();
  String meal = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 40, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Add New Medicine',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(
                            Icons.arrow_downward,
                            color: Colors.green.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 40, top: 30),
                      child: Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 20,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    MedicineInfoTextField(type: 'Medicine Name'),
                    Container(
                      margin: EdgeInsets.only(left: 40, top: 10),
                      child: Text(
                        'Dosage',
                        style: TextStyle(
                            fontSize: 20,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    MedicineDosageField(),
                    MedicinePrograme(),
                    MedicineQuantity(),
                    Container(
                      margin: EdgeInsets.only(left: 40, top: 23, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                meal = 'after';
                              });
                            },
                            child: AfterMeal(meal, 'add'),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                meal = 'before';
                              });
                            },
                            child: BeforeMeal(meal),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: null,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(left: 40, top: 20, right: 40),
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          height: 55,
                          width: MediaQuery.of(context).size.width * .8,
                          child: Center(
                            child: Text(
                              'Add Schedule',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
