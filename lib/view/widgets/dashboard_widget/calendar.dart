import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:Vitals/utils.dart';

class CustomCalendar extends StatefulWidget {
  final String format;

  CustomCalendar(this.format);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    /*  _calendarController = CalendarController(); */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double dayBox = size.width * 0.143;
    double leftMargin = dayBox * 0.11;
    double afterLeftmargin = dayBox - leftMargin;
    return TableCalendar(
      
      calendarStyle: CalendarStyle(
      
        cellMargin: EdgeInsets.all(5),
        selectedDecoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Color(0xffEDF7FF),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        selectedTextStyle: TextStyle(
            color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w600),
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
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
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
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
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
            color: Color(0x000000
).withOpacity(.25), fontSize: 18, fontWeight: FontWeight.w600),
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
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
        weekendStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
      ),
      headerStyle: HeaderStyle(
        leftChevronVisible: true,
        leftChevronIcon: Icon(Icons.keyboard_arrow_left,color: Colors.white,),
        rightChevronIcon: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
        titleCentered: true,
        titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize:18),
        formatButtonVisible: false,
         formatButtonShowsNext: true,
      ),
      rowHeight: 60,
      
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.

        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = focusedDay;
      },
    );
  }
}

Widget _buildEventsMarker(DateTime date, List events, Size size) {
  return Container(
    height: 41,
    width: size.width * 0.10555,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
        color: Color(0xff4E6786),
      ),
    ),
    child: Column(
      children: [
        SizedBox(
          height: 34,
        ),
        Container(
          height: 2,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffFD942A),
          ),
        ),
      ],
    ),
  );
}

Widget _buildHolidaysMarker() {
  return Icon(
    Icons.add_box,
    size: 20.0,
    color: Colors.blueGrey[800],
  );
}
