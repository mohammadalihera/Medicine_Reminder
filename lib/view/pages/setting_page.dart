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
         
          List<Vital> data = await Repository.getAllVitals();
          
          print(data);
        },
        child: Center(
          child: Text('Settings Page'),
        ),
      ),
    );
  }
}
