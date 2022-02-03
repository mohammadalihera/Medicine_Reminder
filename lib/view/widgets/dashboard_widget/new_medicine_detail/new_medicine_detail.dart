import 'dart:math';

import 'package:Vitals/controller/add_medicine/add_medicine_controller.dart';
import 'package:Vitals/controller/get_medicine/get_medicine.dart';
import 'package:Vitals/controller/notification/notification_controller.dart';
import 'package:Vitals/database/vital_reprository.dart';
import 'package:Vitals/main.dart';
import 'package:Vitals/model/medicine_model.dart';
import 'package:Vitals/notification/notification.dart';
import 'package:Vitals/view/pages/home/home_page.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/meal/after_meal.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/meal/before_meal.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/medicine_dosage.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/medicine_info_text_field.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/medicine_program/medicine_program.dart';
import 'package:Vitals/view/widgets/dashboard_widget/new_medicine_detail/medicine_quantity/medicine_quantity.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/src/flutter_local_notifications_plugin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewMedicineDetail extends StatefulWidget {
  @override
  _NewMedicineDetailState createState() => _NewMedicineDetailState();
}

class _NewMedicineDetailState extends State<NewMedicineDetail> {
  TextEditingController editingController = new TextEditingController();
  String meal = '';
  AddMedicineController addmedicineController =
      Get.put(AddMedicineController());
  NotificationController notificationC = Get.put(NotificationController());
  GetMedicineController getmedicineController =
      Get.put(GetMedicineController());
  double screenWidth = 0;
  double dosageGap = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 380) {
      dosageGap = 3;
    }
    if (screenWidth > 380) {
      dosageGap = 12;
    }

    return GetBuilder<AddMedicineController>(
        init: AddMedicineController(),
        builder: (addController) {
          return Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 40, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Add New Medicine',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: InkWell(
                            onTap: () {
                              print('hello');
                              //  notify();
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.green.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 30),
                          child: Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 20,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        MedicineInfoTextField(
                          type: 'Medicine Name',
                          vitelName: '',
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 10),
                          child: Text(
                            'Daily Dosage',
                            style: TextStyle(
                                fontSize: 20,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        MedicineDosageField(dosageGap: dosageGap),
                        MedicinePrograme(),
                        MedicineQuantity(),
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 23, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.find<AddMedicineController>()
                                      .changeAfterMeal(1);
                                  setState(() {
                                    meal = 'after';
                                  });
                                },
                                child: AfterMeal(meal, 'add'),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.find<AddMedicineController>()
                                      .changeAfterMeal(0);
                                  setState(() {
                                    meal = 'before';
                                  });
                                },
                                child: BeforeMeal(meal, 'other'),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            addvitel(
                                addController.name,
                                addController.doseOne,
                                addController.doseTwo,
                                addController.doseThree,
                                addController.doseFour,
                                addController.doseFive,
                                addController.doseSix,
                                addController.program,
                                addController.quantity,
                                addController.afterMeal,
                                getmedicineController.selectedDate,
                                context);
                          },
                          child: Center(
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 40, top: 20, right: 40),
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              height: 55,
                              width: MediaQuery.of(context).size.width * .8,
                              child: Center(
                                child: Text(
                                  'Add Schedule',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

void addvitel(
    String vName,
    String doseOne,
    String doseTwo,
    String doseThree,
    String doseFour,
    String doseFive,
    String doseSix,
    int program,
    int quantity,
    int afterMeal,
    DateTime selectedDate,
    context) async {
  DateTime newMedicineDate = selectedDate;
  GetMedicineController getmedicineController =
      Get.put(GetMedicineController());
  NotificationController notificationC = Get.put(NotificationController());
  Vital vital = Vital(
    id: Random().nextInt(10000000),
    name: vName,
    doseOne: doseOne,
    doseTwo: doseTwo,
    doseThree: doseThree,
    doseFour: doseFour,
    doseFive: doseFive,
    doseSix: doseSix,
    date: newMedicineDate.millisecondsSinceEpoch.toString(),
    program: program,
    quantity: quantity,
    afterMeal: afterMeal,
  );
  print(vitel.id);
  for (int i = 0; i < vitel.program - 1; ++i) {
    newMedicineDate = newMedicineDate.add(Duration(milliseconds: 86400000));
    vitel.date =
        vitel.date + ',' + newMedicineDate.millisecondsSinceEpoch.toString();
  }
  dynamic result = await Repository.insertData("Vitals", vital.vitalToMap());
  getmedicineController.getAllVitalFromDb(context);
  List<String> newDoses = getDoses(vital);
  List<String> vDate = vital.date.split(',');
  print(newDoses);
  print(vDate);
  //List<DateTime> notify = notificationC.getNotificationTime(vDate, newDoses);
  for (int i = 0; i < vDate.length; ++i) {
    for (int j = 0; j < newDoses.length; ++j) {
      int vitalDate = int.parse(vDate[i]);
      DateTime vitald = DateTime(
          DateTime.fromMillisecondsSinceEpoch(vitalDate).year,
          DateTime.fromMillisecondsSinceEpoch(vitalDate).month,
          DateTime.fromMillisecondsSinceEpoch(vitalDate).day);

      print(new DateFormat('yyyyy.MM.dd GGG hh:mm aaa').parse('0' +
          vitald.year.toString() +
          '.' +
          vitald.month.toString() +
          '.' +
          vitald.day.toString() +
          ' ' +
          'AD' +
          ' ' +
          newDoses[j]));

      DateTime finaNotifyDate = new DateFormat('yyyyy.MM.dd GGG hh:mm aaa')
          .parse('0' +
              vitald.year.toString() +
              '.' +
              vitald.month.toString() +
              '.' +
              vitald.day.toString() +
              ' ' +
              'AD' +
              ' ' +
              newDoses[j]);
      print(vitald);

      print(newDoses[j]);
      // DateTime notifyDate=DateTime.
      notify(finaNotifyDate, vital);
    }
  }
  Navigator.pop(context);
}

getDoses(Vital vital) {
  List<String> allDose = [];
  if (vital.doseSix.isNotEmpty) {
    allDose.add(vital.doseOne);
    allDose.add(vital.doseTwo);
    allDose.add(vital.doseThree);
    allDose.add(vital.doseFour);
    allDose.add(vital.doseFive);
    allDose.add(vital.doseSix);
  } else if (vital.doseFive.isNotEmpty) {
    allDose.add(vital.doseOne);
    allDose.add(vital.doseTwo);
    allDose.add(vital.doseThree);
    allDose.add(vital.doseFour);
    allDose.add(vital.doseFive);
  } else if (vital.doseFour.isNotEmpty) {
    allDose.add(vital.doseOne);
    allDose.add(vital.doseTwo);
    allDose.add(vital.doseThree);
    allDose.add(vital.doseFour);
  } else if (vital.doseThree.isNotEmpty) {
    allDose.add(vital.doseOne);
    allDose.add(vital.doseTwo);
    allDose.add(vital.doseThree);
  } else if (vital.doseTwo.isNotEmpty) {
    allDose.add(vital.doseOne);
    allDose.add(vital.doseTwo);
  } else {
    allDose.add(vital.doseOne);
  }
  return allDose;
}

void notify(DateTime schedule, Vital vital) async {
  print('all'+vital.date);
  print("deleted: " + schedule.millisecondsSinceEpoch.toString());
  vital.date =
      vital.date.replaceAll(schedule.millisecondsSinceEpoch.toString(), '');
  dynamic result =
      await Repository.update("Vitals", vital.vitalToMap(), vital.id);
  print(vital.date);
  print('hi');
  AwesomeNotifications().actionStream.listen((event) async {
    print('event received!');
    print(event.toMap().toString());
    // do something based on event...
  });

  AwesomeNotifications().createNotification(
    actionButtons: [
      NotificationActionButton(
        label: 'Snooz',
        enabled: true,
        buttonType: ActionButtonType.Default,
        key: '22',
        showInCompactView: true,
      ),
      NotificationActionButton(
          label: 'Dismiss',
          enabled: true,
          buttonType: ActionButtonType.Default,
          key: '33'),
      NotificationActionButton(
          label: 'Dismiss',
          enabled: true,
          buttonType: ActionButtonType.Default,
          key: '33')
    ],
    content: NotificationContent(
      id: Random().nextInt(10000000),
      channelKey: 'basic_channel',
      title: vital.name,
      body: 'Take your medicine please',
      // backgroundColor: Colors.blue,
      // color: Colors.red,
      displayOnBackground: true,
      displayOnForeground: true,
      bigPicture: 'asset://assets/images/no_vital.png',
      notificationLayout: NotificationLayout.BigPicture,
    ),
    schedule: NotificationCalendar.fromDate(
      date: DateTime(
        schedule.year,
        schedule.month,
        schedule.day,
        schedule.hour,
        schedule.minute,
      ),
    ),
  );
}
