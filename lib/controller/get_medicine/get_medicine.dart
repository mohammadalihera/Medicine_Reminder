import 'package:Vitals/database/vital_reprository.dart';
import 'package:Vitals/model/medicine_model.dart';
import 'package:Vitals/notification/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

final Notifications _notifications = Notifications();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class GetMedicineController extends GetxController {
  late BuildContext context;
  Future initNotifies() async => flutterLocalNotificationsPlugin =
      await _notifications.initNotifies(context);

  List<Vital> selectedVital = [];
  List<Vital> allVital = [];
  String nextDoseTime = '';
  Map<DateTime, List<Vital>> vital = {};
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  void getAllVitalFromDb(BuildContext context) async {
    vital = {};
    allVital = await Repository.getAllVitals();
    // allVital.sort((a, b) => a.date.compareTo(b.date));
    for (int i = 0; i < allVital.length; ++i) {
      List<String> dbDates = allVital[i].date.split(',');
      for (int j = 0; j < dbDates.length; ++j) {
        int dateInt = int.parse(dbDates[j]);
        DateTime mapDate = DateTime(
            DateTime.fromMillisecondsSinceEpoch(dateInt).year,
            DateTime.fromMillisecondsSinceEpoch(dateInt).month,
            DateTime.fromMillisecondsSinceEpoch(dateInt).day);
        if (!vital.containsKey(mapDate)) {
          vital[mapDate] = [allVital[i]];
        } else {
          vital[mapDate]!.add(allVital[i]);
        }
      }
      DateTime alarm = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, DateTime.now().hour, DateTime.now().minute + 2);
    }

    selectVitals(selectedDate);
    update();
  }

  void getNotification(BuildContext context) async {
    // ignore: unused_element

    vital = {};
    allVital = await Repository.getAllVitals();
    // allVital.sort((a, b) => a.date.compareTo(b.date));
    for (int i = 0; i < allVital.length; ++i) {
      DateTime alarm = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, DateTime.now().hour, DateTime.now().minute + 2);
      await _notifications.showNotification(
          allVital[i].name,
          allVital[i].program.toString(),
          alarm.millisecond,
          allVital[i].id,
          flutterLocalNotificationsPlugin);
    }

    selectVitals(selectedDate);
    update();
  }

  getSelectedVital(DateTime date) {
    DateTime eventDate = DateTime(date.year, date.month, date.day);

    return vital[eventDate] ?? [];
  }

  selectVitals(DateTime date) {
    DateTime eventDate = DateTime(date.year, date.month, date.day);
    selectedDate = eventDate;
    selectedVital = vital[eventDate] ?? [];

    update();
  }

  nextDose() async {
    List<Vital> vitals = await Repository.getAllVitals();
    DateTime now = DateTime.now();

    for (int i = 0; i < vital.length; ++i) {
      print(vitals[i].date);
      List<String> dates = allVital[i].date.split(',');
      for (int j = 0; j < dates.length; ++j) {
        int dateInt = int.parse(dates[j]);
      }
    }
  }
}
