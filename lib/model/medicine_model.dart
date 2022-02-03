import 'dart:core';

class Vitel {
  int id;
  String name;
  String doseOne;
  String doseTwo;
  String doseThree;
  String doseFour;
  String doseFive;
  String doseSix;
  String date;
  int program;
  int quantity;

  int afterMeal;
  Vitel(
      {required this.id,
      required this.name,
      required this.doseOne,
      required this.doseTwo,
      required this.doseThree,
      required this.doseFour,
      required this.doseFive,
      required this.doseSix,
      required this.date,
      required this.program,
      required this.quantity,
      required this.afterMeal});
//========================set vital to map======================
  Map<String, dynamic> vitelToMap() {
    Map<String, dynamic> map = Map();
    map['id'] = this.id;
    map['name'] = this.name;
    map['doseOne'] = this.doseOne;
    map['doseTwo'] = this.doseTwo;
    map['doseThree'] = this.doseThree;
    map['doseFour'] = this.doseFour;
    map['doseFive'] = this.doseFive;
    map['doseSix'] = this.doseSix;
    map['date'] = this.date;
    map['program'] = this.program;
    map['quantity'] = this.quantity;
    map['afterMeal'] = this.afterMeal;
    return map;
  }

//=========================create pill object from map================================
  static Vitel vitelMapToObject(Map<String, dynamic> vitelMap) {
    return Vitel(
        id: vitelMap['id'],
        name: vitelMap['name'],
        doseOne: vitelMap['doseOne'],
        doseTwo: vitelMap['doseTwo'],
        doseThree: vitelMap['doseThree'],
        doseFour: vitelMap['doseFour'],
        doseFive: vitelMap['doseFive'],
        doseSix: vitelMap['doseSix'],
        date: vitelMap['date'],
        program: vitelMap['program'],
        quantity: vitelMap['quantity'],
        afterMeal: vitelMap['afterMeal']);
  }
}
