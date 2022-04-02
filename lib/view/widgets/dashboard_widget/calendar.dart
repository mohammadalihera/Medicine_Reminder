import 'package:Vitel/controller/get_medicine/get_medicine.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:Vitel/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../database/caching/cache.dart';

class CustomCalendar extends StatefulWidget {
  final String format;

  CustomCalendar(this.format);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime selectedDate = DateTime.now();

  GetMedicineController addmedicineController =
      Get.put(GetMedicineController());
  List<Vitel> calendarvital = [];
  @override
  void initState() {
    addmedicineController.getAllVitelFromDb(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CacheService.instance.initFirstDayHive();
    String? firstDayofWeek =
        CacheService.instance.firstDayOfWeek.get('firstDayOfWeek');
    Size size = MediaQuery.of(context).size;
    double dayBox = size.width * 0.143;
    double leftMargin = dayBox * 0.11;
    double afterLeftmargin = dayBox - leftMargin;
    return GetBuilder<GetMedicineController>(
        init: GetMedicineController(),
        builder: (getvitalController) {
          return TableCalendar(
            eventLoader: (day) => getvitalController.getSelectedVital(day),
            calendarStyle: CalendarStyle(
              markerDecoration: BoxDecoration(
                color: Color.fromARGB(255, 245, 240, 240),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              cellMargin: EdgeInsets.all(5),
              selectedDecoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Color(0xffEDF7FF),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              
              selectedTextStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              defaultDecoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Color(0xEDF7FF).withOpacity(0.15),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    offset: Offset(4, 4), // Shadow position
                  ),
                ],
              ),
              defaultTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              todayDecoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.black.withOpacity(0.18),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    offset: Offset(4, 4), // Shadow position
                  ),
                ],
              ),
              todayTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              outsideDecoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Color(0xEDF7FF).withOpacity(0.15),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    offset: Offset(4, 4), // Shadow position
                  ),
                ],
              ),
              outsideTextStyle: TextStyle(
                  color: Color(0x000000).withOpacity(.25),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              weekendDecoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Color(0xEDF7FF).withOpacity(0.15),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    offset: Offset(4, 4), // Shadow position
                  ),
                ],
              ),
              weekendTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              weekendStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            headerStyle: HeaderStyle(
              headerPadding: EdgeInsets.all(0.0),
              leftChevronVisible: true,
              leftChevronIcon: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
              rightChevronIcon: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
              titleCentered: true,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              formatButtonVisible: false,
              formatButtonShowsNext: true,
            ),
            rowHeight: 60,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  selectedDate = selectedDay;
                });

                addmedicineController.selectVitals(selectedDay);
              }
            },
            startingDayOfWeek: getvitalController.firstDayOfWeek == 'Sun'
                ? StartingDayOfWeek.sunday
                : getvitalController.firstDayOfWeek == 'Mon'
                    ? StartingDayOfWeek.monday
                    : getvitalController.firstDayOfWeek == 'Tue'
                        ? StartingDayOfWeek.tuesday
                        : getvitalController.firstDayOfWeek == 'Wed'
                            ? StartingDayOfWeek.wednesday
                            : getvitalController.firstDayOfWeek == 'Thu'
                                ? StartingDayOfWeek.thursday
                                : getvitalController.firstDayOfWeek == 'Fri'
                                    ? StartingDayOfWeek.friday
                                    : StartingDayOfWeek.saturday,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          );
        });
  }
}
