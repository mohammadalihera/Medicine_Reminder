import 'dart:core';

class Vital {
  int id;
  String name;
  String doseOne;
  String doseTwo;
  String doseThree;
  String doseFour;
  String doseFive;
  String doseSix;
  String startDate;
  int program;
  int quantity;
  String endDate;
  bool afterMeal;
  Vital(
    {
    required this.id,
    required this.name,
    required this.doseOne,
    required this.doseTwo,
    required this.doseThree,
    required this.doseFour,
    required this.doseFive,
    required this.doseSix,
    required this.startDate,
    required this.program,
    required this.quantity,
    required this.endDate,
    required this.afterMeal 
    }
  );
//========================set vital to map======================
  Map<String, dynamic> vitalToMap() {
    Map<String, dynamic> map = Map();
    map['id'] = this.id;
    map['name'] = this.name;
    map['doseOne'] = this.doseOne;
    map['doseTwo'] = this.doseTwo;
    map['doseThree'] = this.doseThree;
    map['doseFour'] = this.doseFour;
    map['doseFive'] = this.doseFive;
    map['doseSix'] = this.doseSix;
    map['startDate'] = this.startDate;
    map['program'] = this.program;
    map['quantity'] = this.quantity;
    map['endDate'] = this.endDate;
    map['afterMeal'] = this.afterMeal;
    return map;
  }

//=========================create pill object from map================================
 Vital vitalMapToObject(Map<String, dynamic> vitalMap) {
    return Vital(
        id:  vitalMap['id'],
        name: vitalMap['name'] ,
        doseOne: vitalMap['doseOne'] ,
        doseTwo: vitalMap['doseTwo'],
          doseThree: vitalMap['doseThree'],
        doseFour: vitalMap['doseFour'] ,
        doseFive: vitalMap['doseFive'] ,
        doseSix: vitalMap['doseSix'] ,
        startDate: vitalMap['startDate'] ,
        program: vitalMap['program'] ,
        quantity: vitalMap['quantity'],
        endDate: vitalMap['endDate'], 
        afterMeal: vitalMap['afterMeal']
        );
  }
}
