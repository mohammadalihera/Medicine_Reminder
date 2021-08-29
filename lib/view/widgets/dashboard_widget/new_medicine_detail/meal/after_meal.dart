import 'package:flutter/material.dart';

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
      width:
          widget.from == 'dash' ? 100 : MediaQuery.of(context).size.width * .35,
      decoration: BoxDecoration(
          color:
              widget.meal == 'after' ? Color(0xffb60CC6B) : Color(0xFFD3DAD4),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: Center(
        child: Text(
          'After Meal',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
