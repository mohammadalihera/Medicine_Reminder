import 'dart:math';

import 'package:Vitel/controller/add_medicine/add_medicine_controller.dart';
import 'package:Vitel/controller/get_medicine/get_medicine.dart';
import 'package:Vitel/controller/notification/notification_controller.dart';
import 'package:Vitel/database/vitel_reprository.dart';
import 'package:Vitel/main.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:Vitel/notification/notification.dart';
import 'package:Vitel/view/pages/home/home_page.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/meal/after_meal.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/meal/before_meal.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/medicine_dosage.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/medicine_info_text_field.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/medicine_program/medicine_program.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/medicine_quantity/medicine_quantity.dart';
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
  Vitel vitel = Vitel(
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
  dynamic result = await Repository.insertData("Vitel", vitel.vitelToMap());
  getmedicineController.getAllVitelFromDb(context);
  List<String> newDoses = getDoses(vitel);
  List<String> vDate = vitel.date.split(',');
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
      notify(finaNotifyDate, vitel);
    }
  }
  Navigator.pop(context);
}

getDoses(Vitel vitel) {
  List<String> allDose = [];
  if (vitel.doseSix.isNotEmpty) {
    allDose.add(vitel.doseOne);
    allDose.add(vitel.doseTwo);
    allDose.add(vitel.doseThree);
    allDose.add(vitel.doseFour);
    allDose.add(vitel.doseFive);
    allDose.add(vitel.doseSix);
  } else if (vitel.doseFive.isNotEmpty) {
    allDose.add(vitel.doseOne);
    allDose.add(vitel.doseTwo);
    allDose.add(vitel.doseThree);
    allDose.add(vitel.doseFour);
    allDose.add(vitel.doseFive);
  } else if (vitel.doseFour.isNotEmpty) {
    allDose.add(vitel.doseOne);
    allDose.add(vitel.doseTwo);
    allDose.add(vitel.doseThree);
    allDose.add(vitel.doseFour);
  } else if (vitel.doseThree.isNotEmpty) {
    allDose.add(vitel.doseOne);
    allDose.add(vitel.doseTwo);
    allDose.add(vitel.doseThree);
  } else if (vitel.doseTwo.isNotEmpty) {
    allDose.add(vitel.doseOne);
    allDose.add(vitel.doseTwo);
  } else {
    allDose.add(vitel.doseOne);
  }
  return allDose;
}

void notify(DateTime schedule, Vitel vitel) async {
  print('all'+vitel.date);
  print("deleted: " + schedule.millisecondsSinceEpoch.toString());
  vitel.date =
      vitel.date.replaceAll(schedule.millisecondsSinceEpoch.toString(), '');
  dynamic result =
      await Repository.update("Vitel", vitel.vitelToMap(), vitel.id);
  print(vitel.date);
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
      title: vitel.name,
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
