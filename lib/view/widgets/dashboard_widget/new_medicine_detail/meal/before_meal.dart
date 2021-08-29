import 'package:flutter/material.dart';

class BeforeMeal extends StatefulWidget {
  String meal;
  String from;
  BeforeMeal(this.meal);

  @override
  _BeforeMealState createState() => _BeforeMealState();
}

class _BeforeMealState extends State<BeforeMeal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 11),
     height: widget.from=='dash'?20:30,
      width:widget.from=='dash'?100:MediaQuery.of(context).size.width*.35,
      decoration: BoxDecoration(
          color: widget.meal == 'before' ? Color(0xffFF5D5D) : Colors.grey,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: Center(
        child: Text(
          'Before Meal',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
