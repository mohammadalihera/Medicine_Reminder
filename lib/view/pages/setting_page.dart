import 'dart:convert';
import 'package:Vitel/database/vitel_reprository.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Vitel> dataFromJson(String str) =>
      List<Vitel>.from(json.decode(str).map((x) => Vitel.vitelMapToObject(x)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: InkWell(
        onTap: () async {
          DateTime newMedicineDate = DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day);

          List<Vitel> data = await Repository.getAllVitels();
          for (int i = 0; i < data.length; ++i) {
            List<String> dbDates = data[i].date.split(',');
            int d = int.parse(dbDates[1]);
            DateTime mapDate = DateTime(
                DateTime.fromMillisecondsSinceEpoch(d).year,
                DateTime.fromMillisecondsSinceEpoch(d).month,
                DateTime.fromMillisecondsSinceEpoch(d).day);
          }
          print('-----------------------');
          print(data.length);
        },
        child: Center(
          child: Text('Settings Page'),
        ),
      ),
    );
  }
}
