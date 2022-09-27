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
  int totalDose = 0;
  late String startDate;
  late int program = 0;
  late int quantity = 0;
  late String endDate;
  int afterMeal = 0;
  bool isDoseEmpty = false;
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

  void allDoseSet() {
    if (totalDose == 6) {
      if (doseOne.isNotEmpty &&
          doseTwo.isNotEmpty &&
          doseThree.isNotEmpty &&
          doseFour.isNotEmpty &&
          doseFive.isNotEmpty &&
          doseSix.isNotEmpty) {
        doseEmpty(false);
      } else {
        doseEmpty(true);
      }
    } else if (totalDose == 5) {
      if (doseOne.isNotEmpty &&
          doseTwo.isNotEmpty &&
          doseThree.isNotEmpty &&
          doseFour.isNotEmpty &&
          doseFive.isNotEmpty) {
        doseEmpty(false);
      } else {
        doseEmpty(true);
      }
    } else if (totalDose == 4) {
      if (doseOne.isNotEmpty && doseTwo.isNotEmpty && doseThree.isNotEmpty && doseFour.isNotEmpty) {
        doseEmpty(false);
      } else {
        doseEmpty(true);
      }
    } else if (totalDose == 3) {
      if (doseOne.isNotEmpty && doseTwo.isNotEmpty && doseThree.isNotEmpty) {
        doseEmpty(false);
      } else {
        doseEmpty(true);
      }
    } else if (totalDose == 2) {
      if (doseOne.isNotEmpty && doseTwo.isNotEmpty) {
        doseEmpty(false);
      } else {
        doseEmpty(true);
      }
    } else if (totalDose == 1) {
      if (doseOne.isNotEmpty) {
        doseEmpty(false);
      } else {
        doseEmpty(true);
      }
    } else {
      doseEmpty(false);
    }
  }
}
