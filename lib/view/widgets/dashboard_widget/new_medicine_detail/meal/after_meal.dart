import 'package:Vitel/controller/get_medicine/get_medicine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AfterMeal extends StatefulWidget {
  String meal;
  String from;
  AfterMeal(this.meal, this.from);
  @override
  _AfterMealState createState() => _AfterMealState();
}

class _AfterMealState extends State<AfterMeal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.from == 'dash' ? 20 : 30,
      width: widget.from == 'dash' ? 100 : MediaQuery.of(context).size.width * .35,
      decoration: BoxDecoration(
          color: Get.find<GetMedicineController>().selectedDate.day > DateTime.now().day ||
                  Get.find<GetMedicineController>().selectedDate.day == DateTime.now().day
              ? widget.meal == 'after'
                  ? Color(0xffb60CC6B)
                  : Color(0xFFD3DAD4)
              : Color(0xff606365),
          borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: Center(
        child: Text('After Meal',
            style: widget.from == 'dash'
                ? TextStyle(fontSize: 14, color: Colors.white)
                : TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
