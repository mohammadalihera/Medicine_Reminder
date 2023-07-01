import 'package:Vitel/controller/get_medicine/get_medicine.dart';
import 'package:Vitel/database/caching/cache.dart';
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
        borderRadius: new BorderRadius.only(topRight: Radius.circular(50.0), topLeft: Radius.circular(50.0)),
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
                    Get.find<GetMedicineController>().changeFirstDayOfWeek('Sat');
                    Navigator.pop(context);
                    showSnackBar(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Sat'
                            ? Colors.white
                            : kPrimaryColor),
                    child: Center(
                      child: Text(
                        'Sat',
                        style: TextStyle(
                            color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Sat'
                                ? kPrimaryColor
                                : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.find<GetMedicineController>().changeFirstDayOfWeek('Sun');
                    Navigator.pop(context);
                    showSnackBar(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Sun'
                            ? Colors.white
                            : kPrimaryColor),
                    child: Center(
                      child: Text(
                        'Sun',
                        style: TextStyle(
                            color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Sun'
                                ? kPrimaryColor
                                : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.find<GetMedicineController>().changeFirstDayOfWeek(
                      'Mon',
                    );
                    Navigator.pop(context);
                    showSnackBar(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Mon'
                            ? Colors.white
                            : kPrimaryColor),
                    child: Center(
                        child: Text('Mon',
                            style: TextStyle(
                                color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Mon'
                                    ? kPrimaryColor
                                    : Colors.white,
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
                    Get.find<GetMedicineController>().changeFirstDayOfWeek('Tue');
                    Navigator.pop(context);
                    showSnackBar(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Tue'
                            ? Colors.white
                            : kPrimaryColor),
                    child: Center(
                      child: Text(
                        'Tue',
                        style: TextStyle(
                            color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Tue'
                                ? kPrimaryColor
                                : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.find<GetMedicineController>().changeFirstDayOfWeek('Wed');
                    Navigator.pop(context);
                    showSnackBar(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Wed'
                            ? Colors.white
                            : kPrimaryColor),
                    child: Center(
                        child: Text('Wed',
                            style: TextStyle(
                                color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Wed'
                                    ? kPrimaryColor
                                    : Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.find<GetMedicineController>().changeFirstDayOfWeek(
                      'Thu',
                    );
                    Navigator.pop(context);
                    showSnackBar(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Thu'
                            ? Colors.white
                            : kPrimaryColor),
                    child: Center(
                        child: Text('Thu',
                            style: TextStyle(
                                color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Thu'
                                    ? kPrimaryColor
                                    : Colors.white,
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
                    Get.find<GetMedicineController>().changeFirstDayOfWeek(
                      'Fri',
                    );
                    Navigator.pop(context);
                    showSnackBar(context);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                        color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Fri'
                            ? Colors.white
                            : kPrimaryColor),
                    child: Center(
                        child: Text('Fri',
                            style: TextStyle(
                                color: CacheService.instance.firstDayOfWeek.get('firstDayOfWeek').toString() == 'Fri'
                                    ? kPrimaryColor
                                    : Colors.white,
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

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 1500),
      padding: EdgeInsets.all(0),
      backgroundColor: kPrimaryColor,
      content: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            "First day of the week updated!",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    ));
  }
}
