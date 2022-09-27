import 'package:Vitel/controller/add_medicine/add_medicine_controller.dart';
import 'package:Vitel/controller/get_medicine/get_medicine.dart';
import 'package:Vitel/database/vitel_reprository.dart';
import 'package:Vitel/main.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:Vitel/view/widgets/dashboard_widget/medicine_detail/update_vitel_widgets/update_program.dart';
import 'package:Vitel/view/widgets/dashboard_widget/medicine_detail/update_vitel_widgets/update_quantity.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/meal/after_meal.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/meal/before_meal.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/medicine_info_text_field.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/update_vitel_widgets/update_doses_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateMedicineDetail extends StatefulWidget {
  final Vitel vitel;
  UpdateMedicineDetail(this.vitel);
  @override
  _UpdateMedicineDetailState createState() => _UpdateMedicineDetailState();
}

class _UpdateMedicineDetailState extends State<UpdateMedicineDetail> {
  TextEditingController editingController = new TextEditingController();
  String meal = '';
  AddMedicineController addmedicineController = Get.put(AddMedicineController());
  GetMedicineController getmedicineController = Get.put(GetMedicineController());
  double screenWidth = 0;
  double dosageGap = 0;

  @override
  Widget build(BuildContext context) {
    Vitel vitel = widget.vitel;
    screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 380) {
      dosageGap = 3;
    }
    if (screenWidth > 380) {
      dosageGap = 12;
    }
    meal = vitel.afterMeal == 0 ? 'before' : 'after';
    return GetBuilder<AddMedicineController>(
        init: AddMedicineController(),
        builder: (addController) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
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
                              'Edit Medicine Info',
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 40, top: 30),
                              child: Text(
                                'Name',
                                style: TextStyle(fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.w600),
                              ),
                            ),
                            MedicineInfoTextField(
                              type: 'Medicine Name',
                              vitelName: vitel.name,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40, top: 10),
                              child: Text(
                                'Daily Dosage',
                                style: TextStyle(fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.w600),
                              ),
                            ),
                            UpdateDosageField(
                              dosageGap: dosageGap,
                              vitel: vitel,
                            ),
                            UpdatePrograme(vitel),
                            UpdateMedicineQuantity(vitel),
                            Container(
                              margin: EdgeInsets.only(left: 40, top: 23, right: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.find<AddMedicineController>().changeAfterMeal(1);
                                      setState(() {
                                        meal = 'after';
                                        vitel.afterMeal = 1;
                                      });
                                    },
                                    child: AfterMeal(meal, 'add'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.find<AddMedicineController>().changeAfterMeal(0);
                                      setState(() {
                                        meal = 'before';
                                        vitel.afterMeal = 0;
                                      });
                                    },
                                    child: BeforeMeal(meal, 'other'),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                vitel.name = addController.name;
                                vitel.program = addController.program;
                                vitel.quantity = addController.quantity;
                                addvitel(vitel, addController.program, context);
                              },
                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.only(left: 40, top: 20, right: 40),
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor, borderRadius: BorderRadius.all(Radius.circular(15))),
                                  height: 55,
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: Center(
                                    child: Text(
                                      'Update Schedule',
                                      style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
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
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

void addvitel(Vitel vitel, int additionProgram, context) async {
  DateTime newMedicineDate = DateTime.now();
  print('bitel datee------------------------');
  print(vitel.date);
  if (vitel.date.contains(',')) {
    newMedicineDate = DateTime.fromMillisecondsSinceEpoch(int.parse(vitel.date.split(',').first));
  } else {
    newMedicineDate = DateTime.fromMillisecondsSinceEpoch(int.parse(vitel.date));
  }
  DateTime firstDate = DateTime(newMedicineDate.year, newMedicineDate.month, newMedicineDate.day);

  GetMedicineController getmedicineController = Get.put(GetMedicineController());
  vitel.date = firstDate.millisecondsSinceEpoch.toString();

  for (int i = 1; i < additionProgram; ++i) {
    firstDate = firstDate.add(Duration(milliseconds: 86400000));
    vitel.date = vitel.date + ',' + firstDate.millisecondsSinceEpoch.toString();
  }

  dynamic result = await Repository.update("vitel", vitel.vitelToMap(), vitel.id);
  getmedicineController.getAllVitelFromDb(context);
  Navigator.pop(context);
  Navigator.pop(context);
}
