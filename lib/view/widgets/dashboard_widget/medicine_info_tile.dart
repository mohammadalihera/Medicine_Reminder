import 'package:Vitals/controller/get_medicine/get_medicine.dart';
import 'package:Vitals/model/medicine_model.dart';
import 'package:Vitals/view/widgets/dashboard_widget/medicine_detail/medicine_detail.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/meal/after_meal.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/meal/before_meal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicineInfoTile extends StatefulWidget {
  @override
  _MedicineInfoTileState createState() => _MedicineInfoTileState();
}

class _MedicineInfoTileState extends State<MedicineInfoTile> {
  double displayHeight = 0;
  GetMedicineController getmedicineController =
      Get.put(GetMedicineController());
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 50),
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: GetBuilder<GetMedicineController>(
            init: GetMedicineController(),
            builder: (refreshTabController) {
              return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: getmedicineController.selectedVital.length,
                  itemBuilder: (_, i) {
                    return InkWell(
                      onTap: medicineDetail,
                      child: Card(
                        shadowColor: Colors.blue,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xffEDF7FF).withOpacity(0.2),
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        color: Color(0xffEDF7FF),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.all(4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 4),
                                child: Text(
                                  getmedicineController.selectedVital[i].name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue),
                                ),
                              ),
                              getmedicineController.selectedVital[i].afterMeal ==
                                      1
                                  ? AfterMeal('after', 'dash')
                                  : BeforeMeal('before', 'dash'),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  numberOfTime(
                                      getmedicineController.selectedVital[i]),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 2,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Upcoming Dose',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                     getmedicineController.selectedVital[i].doseOne,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff606365)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }));
  }
   void medicineDetail() {
    double modalHeight = 0;
    if (displayHeight < 750) {
      modalHeight = MediaQuery.of(context).size.height * 0.8;
    }
    if (displayHeight >= 750) {
      modalHeight = modalHeight = MediaQuery.of(context).size.height * 0.72;
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
            child: MedicineDetail(),
          );
        });
  }
}

String numberOfTime(Vital vitla) {
  int num = 0;
  if (vitla.doseOne.isNotEmpty) {
    num = num + 1;
  }
  if (vitla.doseTwo.isNotEmpty) {
    num = num + 1;
  }
  if (vitla.doseThree.isNotEmpty) {
    num = num + 1;
  }
  if (vitla.doseFour.isNotEmpty) {
    num = num + 1;
  }
  if (vitla.doseFive.isNotEmpty) {
    num = num + 1;
  }
  if (vitla.doseSix.isNotEmpty) {
    num = num + 1;
  }
  
  
  return num.toString()+" "+'times';
}
