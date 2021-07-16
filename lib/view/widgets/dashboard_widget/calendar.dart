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
          if (widget.format == 'month') {
            return TableCalendar(
             // events: taskC.mp,
              rowHeight: 55,
              initialCalendarFormat: CalendarFormat.month,
              daysOfWeekStyle: DaysOfWeekStyle(
                dowTextBuilder: (date, locale) {
                  return DateFormat.E(locale).format(date).toUpperCase();
                },
                weekdayStyle: TextStyle(
                  fontFamily: "AvenirNextCyr",
                  color: Colors.white
                  //color: Color(0xFF4E6786),
                ),
              ),
              headerStyle: HeaderStyle(
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
                  //color: Colors.white,
                  fontSize: 18,
                ),
                formatButtonVisible: false,
                formatButtonShowsNext: false,
              ),
              calendarController: _calendarController,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              onDaySelected: (date, events, holidays) {},
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0x324E6786),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xFF4E6786),
                      ),
                    ),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(
                        fontFamily: "AvenirNextCyr",
                        //color: Colors.white,
                      ),
                    ),
                  );
                },
                todayDayBuilder: (context, date, events) => Container(
                  margin: EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0x1EFDD32A),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0x79FDD32A),
                    ),
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontFamily: "AvenirNextCyr",
                      //color: Colors.white,
                    ),
                  ),
                ),
                markersBuilder: (context, date, events, holidays) {
                  final children = <Widget>[];
                  print(events);

                  if (events.isNotEmpty) {
                    children.add(
                      Positioned(
                        right: 1,
                        bottom: 1,
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
                contentPadding:
                    EdgeInsets.only(bottom: 0, left: 8.0, right: 8.0),
                outsideStyle: TextStyle(
                  fontFamily: "AvenirNextCyr",
                  color: Colors.white,
                ),
                weekdayStyle: TextStyle(
                  fontFamily: "AvenirNextCyr",
                  color: Colors.white,
                ),
                todayStyle: TextStyle(
                  fontFamily: "AvenirNextCyr",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            );
          } else {
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
                headerMargin: EdgeInsets.only(top:8),
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
                        margin: EdgeInsets.only(
                            top: 5, bottom: 5, left: 4, right: 4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0x324E6786),
                          borderRadius: BorderRadius.circular(5),
                          /* border: Border.all(
                            color: Color(0xFF4E6786),
                          ), */
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
                          //minHeight: 65,
                          //minWidth: 55,
                          ),
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 7, bottom: 7, left: 4, right: 4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.yellow,
                          ),
                        ),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(
                            fontFamily: "AvenirNextCyr",
                           // color: Colors.white,
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
                        margin: EdgeInsets.only(
                            top: 5, bottom: 5, left: 4, right: 4),
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
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 7, bottom: 7, left: 4, right: 4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          // border: Border.all(
                          //   color: Color(0x79FD942A),
                          // ),
                        ),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(
                            fontFamily: "AvenirNextCyr",
                            color: Colors.blue,
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
                    fontFamily: "AvenirNextCyr",
                    color: Colors.white,
                    fontSize: 16),
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
}

