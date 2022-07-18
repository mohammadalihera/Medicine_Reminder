import 'package:Vitel/controller/get_medicine/get_medicine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeforeMeal extends StatefulWidget {
  String meal;
  String? from;
  BeforeMeal(this.meal, this.from);

  @override
  _BeforeMealState createState() => _BeforeMealState();
}

class _BeforeMealState extends State<BeforeMeal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: widget.from == 'dash' ? 0 : 15),
      height: widget.from == 'dash' ? 20 : 30,
      width: widget.from == 'dash' ? 100 : MediaQuery.of(context).size.width * .35,
      decoration: BoxDecoration(
          color: Get.find<GetMedicineController>().selectedDate.day > DateTime.now().day ||
                  Get.find<GetMedicineController>().selectedDate.day == DateTime.now().day
              ? widget.meal == 'before'
                  ? Color(0xffFF5D5D)
                  : Color(0xfFD3DAD4)
              : Color(0xff606365),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
      child: Center(
        child: Text('Before Meal',
            style: widget.from == 'dash'
                ? TextStyle(fontSize: 14, color: Colors.white)
                : TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
