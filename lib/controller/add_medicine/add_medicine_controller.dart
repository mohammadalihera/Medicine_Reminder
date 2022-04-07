import 'package:get/get.dart';

class AddMedicineController extends GetxController {
  late int id;
  late String name = '';
  String doseOne = '';
  String doseTwo = '';
  String doseThree = '';
  String doseFour = '';
  String doseFive = '';
  String doseSix = '';
  late String startDate;
  late int program = 0;
  late int quantity = 0;
  late String endDate;
  int afterMeal = 0;
  bool isDoseEmpty = true;
  bool addmedicine = false;
  void changeId(int vitelId) {
    id = vitelId;

    update();
  }

  void changeName(String vitelName) {
    name = vitelName;

    update();
  }

  void changeDone(String vitelDone) {
    doseOne = vitelDone;

    update();
  }

  void changeDtwo(String vitelDtwo) {
    doseTwo = vitelDtwo;

    update();
  }

  void isMedicineAdded(bool isAdded) {
    addmedicine = isAdded;

    update();
  }

  void changeDthree(String vitelDthree) {
    doseThree = vitelDthree;

    update();
  }

  void changeDfour(String vitelDfour) {
    doseFour = vitelDfour;

    update();
  }

  void changeDfive(String vitelDfive) {
    doseFive = vitelDfive;

    update();
  }

  void changeDsix(String vitelDsix) {
    doseSix = vitelDsix;

    update();
  }
   void doseEmpty(bool hasDose) {
    isDoseEmpty = hasDose;

    update();
  }

  void changeStartDate(String vitelstart) {
    startDate = vitelstart;

    update();
  }

  void changeProgram(int vitelprog) {
    program = vitelprog;
    endDate = vitelprog.toString();

    update();
  }

  void changeQuantity(int vitelq) {
    quantity = vitelq;

    update();
  }

  void changeEndDate(String vitelend) {
    endDate = vitelend;

    update();
  }

  void changeAfterMeal(int vitelMeal) {
    afterMeal = vitelMeal;
    update();
  }
}
