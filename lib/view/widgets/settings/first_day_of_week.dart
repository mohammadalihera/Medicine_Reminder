import 'package:Vitel/controller/get_medicine/get_medicine.dart';
import 'package:Vitel/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstDayOfWeek extends StatefulWidget {
  @override
  State<FirstDayOfWeek> createState() => _FirstDayOfWeekState();
}

class _FirstDayOfWeekState extends State<FirstDayOfWeek> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.only(
            topRight: Radius.circular(50.0), topLeft: Radius.circular(50.0)),
        color: Color(0xffEDF7FF),
      ),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Center(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.find<GetMedicineController>()
                        .changeFristDayOfWeek('Sat');
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: kPrimaryColor),
                    child: Center(
                      child: Text(
                        'Sat',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.find<GetMedicineController>()
                        .changeFristDayOfWeek('Sun');
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: kPrimaryColor),
                    child: Center(
                        child: Text('Sun',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.find<GetMedicineController>().changeFristDayOfWeek(
                      'Mon',
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: kPrimaryColor),
                    child: Center(
                        child: Text('Mon',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.find<GetMedicineController>()
                        .changeFristDayOfWeek('Tue');
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: kPrimaryColor),
                    child: Center(
                      child: Text(
                        'Tue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.find<GetMedicineController>()
                        .changeFristDayOfWeek('Wed');
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: kPrimaryColor),
                    child: Center(
                        child: Text('Wed',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.find<GetMedicineController>().changeFristDayOfWeek(
                      'Thu',
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: kPrimaryColor),
                    child: Center(
                        child: Text('Thu',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.find<GetMedicineController>().changeFristDayOfWeek(
                      'Fri',
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: kPrimaryColor),
                    child: Center(
                        child: Text('Fri',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600))),
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
