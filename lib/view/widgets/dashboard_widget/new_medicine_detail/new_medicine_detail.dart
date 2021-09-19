import 'dart:math';

import 'package:Vitals/controller/add_medicine/add_medicine_controller.dart';
import 'package:Vitals/controller/get_medicine/get_medicine.dart';
import 'package:Vitals/database/vital_reprository.dart';
import 'package:Vitals/main.dart';
import 'package:Vitals/model/medicine_model.dart';
import 'package:Vitals/view/pages/home/home_page.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/meal/after_meal.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/meal/before_meal.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/medicine_dosage.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/medicine_info_text_field.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/medicine_program/medicine_program.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/medicine_quantity/medicine_quantity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewMedicineDetail extends StatefulWidget {
  @override
  _NewMedicineDetailState createState() => _NewMedicineDetailState();
}

class _NewMedicineDetailState extends State<NewMedicineDetail> {
  TextEditingController editingController = new TextEditingController();
  String meal = '';
  AddMedicineController addmedicineController =
      Get.put(AddMedicineController());
  GetMedicineController getmedicineController =
      Get.put(GetMedicineController());
  double screenWidth = 0;
  double dosageGap = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 380) {
      dosageGap = 3;
    }
    if (screenWidth > 380) {
      dosageGap = 12;
    }
    return GetBuilder<AddMedicineController>(
        init: AddMedicineController(),
        builder: (addController) {
          return Center(
            child: Container(
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
                            'Daily Dosage',
                            style: TextStyle(
                                fontSize: 20,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        MedicineDosageField(dosageGap: dosageGap),
                        MedicinePrograme(),
                        MedicineQuantity(),
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 23, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.find<AddMedicineController>()
                                      .changeAfterMeal(1);
                                  setState(() {
                                    meal = 'after';
                                  });
                                },
                                child: AfterMeal(meal, 'add'),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.find<AddMedicineController>()
                                      .changeAfterMeal(0);
                                  setState(() {
                                    meal = 'before';
                                  });
                                },
                                child: BeforeMeal(meal, 'other'),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            /* print(addController.name);
                            print(addController.doseOne);
                            Vital vital = Vital(
                                id: Random().nextInt(10000000),
                                name: addController.name,
                                doseOne: addController.doseOne,
                                doseTwo: addController.doseTwo,
                                doseThree: addController.doseThree,
                                doseFour: addController.doseFour,
                                doseFive: addController.doseFive,
                                doseSix: addController.doseSix,
                                startDate: DateTime.now().toString(),
                                program: addController.program,
                                quantity: addController.quantity,
                                afterMeal: addController.afterMeal,
                                endDate: addController.endDate,
                                );

                            dynamic result = await Repository.insertData(
                                "Vitals", vital.vitalToMap());

                            print(result); */
                            addVital(
                                addController.name,
                                addController.doseOne,
                                addController.doseTwo,
                                addController.doseThree,
                                addController.doseFour,
                                addController.doseFive,
                                addController.doseSix,
                                addController.program,
                                addController.quantity,
                                addController.afterMeal);
                           
                            getmedicineController.getAllVitalFromDb();
                             Navigator.pop(context);
                           
                          },
                          child: Center(
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 40, top: 20, right: 40),
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              height: 55,
                              width: MediaQuery.of(context).size.width * .8,
                              child: Center(
                                child: Text(
                                  'Add Schedule',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
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
          );
        });
  }
}

void addVital(
  String vName,
  String doseOne,
  String doseTwo,
  String doseThree,
  String doseFour,
  String doseFive,
  String doseSix,
  int program,
  int quantity,
  int afterMeal,
) async {
  DateTime newMedicineDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  Vital vital = Vital(
    id: Random().nextInt(10000000),
    name: vName,
    doseOne: doseOne,
    doseTwo: doseTwo,
    doseThree: doseThree,
    doseFour: doseFour,
    doseFive: doseFive,
    doseSix: doseSix,
    date: newMedicineDate.millisecondsSinceEpoch,
    program: program,
    quantity: quantity,
    afterMeal: afterMeal,
  );
  for (int i = 0; i < vital.program; ++i) {
    dynamic result = await Repository.insertData("Vitals", vital.vitalToMap());
    vital.id = Random().nextInt(10000000);
    newMedicineDate = newMedicineDate.add(Duration(milliseconds: 86400000));
    vital.date = newMedicineDate.millisecondsSinceEpoch;

    print(result);
  }
}
