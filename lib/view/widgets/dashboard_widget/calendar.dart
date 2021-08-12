import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  final String format;

  CustomCalendar(this.format);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarController _calendarController;

  @override
  void initState() {
    _calendarController = CalendarController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double dayBox = size.width * 0.143;
    double leftMargin = dayBox * 0.11;
    double afterLeftmargin = dayBox - leftMargin;
    return TableCalendar(
      // events: taskC.mp,
      calendarController: _calendarController,
      rowHeight: 55,
      initialCalendarFormat: CalendarFormat.week,
      daysOfWeekStyle: DaysOfWeekStyle(
          dowTextBuilder: (date, locale) {
            return DateFormat.E(locale).format(date).toUpperCase();
          },
          weekdayStyle: TextStyle(
            fontFamily: "AvenirNextCyr",
            //color: Color(0xFF4E6786),
          )),
      headerStyle: HeaderStyle(
        headerMargin: EdgeInsets.only(top: 8),
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: Colors.white,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          fontFamily: "AvenirNextCyr",
          color: Colors.white,
          fontSize: 18,
        ),
        centerHeaderTitle: true,
        formatButtonDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      //calendarController: _calendarController,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      // onDaySelected: (date, events, holidays) {
      //   Get.find<CustomTabController>()
      //       .updateTabColor(Get.find<CustomTabController>().index);
      //   //create event here
      //   dateSelectedController.selectedDateTasks = new List<Task>().obs;
      //   if (events != null) {
      //     for (int i = 0; i < events.length; ++i) {
      //       dateSelectedController.selectedDateTasks.add(events[i]);
      //     }
      //   }
      //   Get.find<CustomTabController>()
      //       .updateTabColor(Get.find<CustomTabController>().index);
      // },
      builders: CalendarBuilders(
        dayBuilder: (context, date, events) {
          return Card(
            elevation: 35,
            color: Color(0xffEDF7FF).withOpacity(0.2),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 70,
                minWidth: 50,
                //minHeight: 65,
                //minWidth: 55,
              ),
              child: Container(
                //margin: EdgeInsets.only(top: 7, bottom: 7, left: 4, right: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                    fontFamily: "AvenirNextCyr",
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
        selectedDayBuilder: (context, date, events) {
          Size size = MediaQuery.of(context).size;
          print(size);
          if (events != null) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 50,
                minWidth: 50,
                //minHeight: 65,
                //minWidth: 55,
              ),
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 5, left: 4, right: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0x324E6786),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color(0xFF4E6786),
                  ),
                ),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                    fontFamily: "AvenirNextCyr",
                    //color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          } else {
            return Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 35,
              color: Color(0xff295E99),
              semanticContainer: true,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 70,
                  minWidth: 50,
                  //minHeight: 65,
                  //minWidth: 55,
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 7, bottom: 7, left: 4, right: 4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                        fontFamily: "AvenirNextCyr",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            );
          }
        },
        todayDayBuilder: (context, date, events) {
          if (events != null) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 50,
                minWidth: 50,
              ),
              child: Container(
                // margin: EdgeInsets.only(top: 5, bottom: 5, left: 4, right: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0x1EFD942A),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color(0x79FD942A),
                  ),
                ),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                    fontFamily: "AvenirNextCyr",
                    //color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          } else {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 50,
                minWidth: 50,
              ),
              child: Card(
                elevation: 10,
                color: Color(0xffEDF7FF),
                child: Container(
                  // margin: EdgeInsets.only(top: 4, bottom: 4, left: 3, right: 3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // color: Color(0xffEDF7FF),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontFamily: "AvenirNextCyr",
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            );
          }
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                left: size.width * 0.0152,
                //right: 4,
                bottom: size.height * 0.00943,
                //top:15,
                child: _buildEventsMarker(date, events, size),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      weekendDays: [DateTime.friday, DateTime.saturday],
      calendarStyle: CalendarStyle(
        eventDayStyle: TextStyle(
          fontFamily: "AvenirNextCyr",
          color: Colors.white,
          fontSize: 16,
        ),
        outsideStyle: TextStyle(
          fontFamily: "AvenirNextCyr",
          color: Color(0xFF47515E),
        ),
        weekdayStyle: TextStyle(
            fontFamily: "AvenirNextCyr", color: Colors.white, fontSize: 16),
        todayStyle: TextStyle(
          fontFamily: "AvenirNextCyr",
          fontSize: 16,
          color: Colors.white,
        ),
        weekendStyle: TextStyle(
          fontFamily: "AvenirNextCyr",
          color: Colors.red,
          fontSize: 16,
        ),
      ),
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
