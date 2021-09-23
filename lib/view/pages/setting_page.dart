import 'dart:convert';

import 'package:Vitals/database/vital_reprository.dart';
import 'package:Vitals/model/medicine_model.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Vital> dataFromJson(String str) =>
      List<Vital>.from(json.decode(str).map((x) => Vital.vitalMapToObject(x)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: InkWell(
        onTap: () async {
         DateTime newMedicineDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
      print(newMedicineDate.toString());
          List<Vital> data = await Repository.getAllVitals();
          for(int i=0;i<data.length;++i){
            print(data[i].name);
            print(data[i].id);
            print(data[i].date.toString());
            List<String> dbDates= data[i].date.split(',');
            print(int.parse(dbDates[0]));
            int d=int.parse(dbDates[1]);
            DateTime mapDate = DateTime(
          DateTime.fromMillisecondsSinceEpoch(d).year,
          DateTime.fromMillisecondsSinceEpoch(d).month,
          DateTime.fromMillisecondsSinceEpoch(d).day);
          print(mapDate);
          }
          print(data);
        },
        child: Center(
          child: Text('Settings Page'),
        ),
      ),
    );
  }
}
