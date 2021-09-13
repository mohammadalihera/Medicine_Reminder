import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddMedicineController extends GetxController {
  late int id;
  late String name;
   String doseOne = '';
  String doseTwo = '';
   String doseThree = '';
   String doseFour = '';
   String doseFive = '';
   String doseSix = '';
  late String startDate;
  late int program;
  late int quantity;
  late String endDate;
   int afterMeal=0;
  void changeId(int vitalId) {
    id = vitalId;

    update();
  }

  void changeName(String vitalName) {
    name = vitalName;

    update();
  }

  void changeDone(String vitalDone) {
    doseOne = vitalDone;

    update();
  }

  void changeDtwo(String vitalDtwo) {
    doseTwo = vitalDtwo;

    update();
  }

  void changeDthree(String vitalDthree) {
    doseThree = vitalDthree;

    update();
  }

  void changeDfour(String vitalDfour) {
    doseFour = vitalDfour;

    update();
  }

  void changeDfive(String vitalDfive) {
    doseFive = vitalDfive;

    update();
  }

  void changeDsix(String vitalDsix) {
    doseSix = vitalDsix;

    update();
  }

  void changeStartDate(String vitalstart) {
    startDate = vitalstart;

    update();
  }

  void changeProgram(int vitalprog) {
    program = vitalprog;
    endDate=vitalprog.toString();

    update();
  }

  void changeQuantity(int vitalq) {
    quantity = vitalq;

    update();
  }

  void changeEndDate(String vitalend) {
    endDate = vitalend;

    update();
  }

  void changeAfterMeal(int vitalMeal) {
    afterMeal = vitalMeal;
    update();
  }
}
