import 'package:Vitel/database/vitel_reprository.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:Vitel/notification/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../database/caching/cache.dart';
import 'package:hive/hive.dart';

final Notifications _notifications = Notifications();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class GetMedicineController extends GetxController {
  // CacheService.instance.initFirstDayHive();
  String firstDayOfWeek =
      CacheService.instance.firstDayOfWeek.get('firstDayOfWeek') != null
          ? CacheService.instance.firstDayOfWeek
              .get('firstDayOfWeek')
              .toString()
          : 'Sun';
  late BuildContext context;
  Future initNotifies() async => flutterLocalNotificationsPlugin =
      await _notifications.initNotifies(context);

  List<Vitel> selectedVitel = [];
  List<Vitel> allVitel = [];
  String nextDoseTime = '';
  Map<DateTime, List<Vitel>> vitel = {};
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  void getAllVitelFromDb(BuildContext context) async {
    vitel = {};
    allVitel = await Repository.getAllVitels();
    // allVital.sort((a, b) => a.date.compareTo(b.date));
    for (int i = 0; i < allVitel.length; ++i) {
      List<String> dbDates = allVitel[i].date.split(',');
      for (int j = 0; j < dbDates.length; ++j) {
        int dateInt = int.parse(dbDates[j]);
        DateTime mapDate = DateTime(
            DateTime.fromMillisecondsSinceEpoch(dateInt).year,
            DateTime.fromMillisecondsSinceEpoch(dateInt).month,
            DateTime.fromMillisecondsSinceEpoch(dateInt).day);
        if (!vitel.containsKey(mapDate)) {
          vitel[mapDate] = [allVitel[i]];
        } else {
          vitel[mapDate]!.add(allVitel[i]);
        }
      }
      DateTime alarm = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, DateTime.now().hour, DateTime.now().minute + 2);
    }

    selectVitals(selectedDate);
    update();
  }

  changeFirstDayOfWeek(String day) {
    CacheService.instance.initFirstDayHive();
    CacheService.instance.firstDayOfWeek.put('firstDayOfWeek', day);
    firstDayOfWeek = day;
    update();
  }

  void getNotification(BuildContext context) async {
    // ignore: unused_element

    vitel = {};
    allVitel = await Repository.getAllVitels();
    // allVital.sort((a, b) => a.date.compareTo(b.date));
    for (int i = 0; i < allVitel.length; ++i) {
      DateTime alarm = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, DateTime.now().hour, DateTime.now().minute + 2);
      await _notifications.showNotification(
          allVitel[i].name,
          allVitel[i].program.toString(),
          alarm.millisecond,
          allVitel[i].id,
          flutterLocalNotificationsPlugin);
    }

    selectVitals(selectedDate);
    update();
  }

  getSelectedVital(DateTime date) {
    DateTime eventDate = DateTime(date.year, date.month, date.day);

    return vitel[eventDate] ?? [];
  }

  selectVitals(DateTime date) {
    DateTime eventDate = DateTime(date.year, date.month, date.day);
    selectedDate = eventDate;
    selectedVitel = vitel[eventDate] ?? [];

    update();
  }

  nextDose() async {
    List<Vitel> vitals = await Repository.getAllVitels();
    DateTime now = DateTime.now();

    for (int i = 0; i < vitel.length; ++i) {
     
      List<String> dates = allVitel[i].date.split(',');
      for (int j = 0; j < dates.length; ++j) {
        int dateInt = int.parse(dates[j]);
      }
    }
  }
}
