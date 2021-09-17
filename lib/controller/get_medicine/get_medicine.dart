import 'package:Vitals/database/vital_reprository.dart';
import 'package:Vitals/model/medicine_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GetMedicineController extends GetxController {
  List<Vital> selectedVital = [];
  List<Vital> allVital = [];
  Map<DateTime, List<Vital>> vital = {};
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  void getAllVitalFromDb() async {
    allVital = await Repository.getAllVitals();
    allVital.sort((a, b) => a.date.compareTo(b.date));
    int k = 0;
    for (int i = 0; i < allVital.length; ++i) {
      print('----------------------------++++++++++++++++++++++++++++++');

      DateTime mapDate = DateTime(
          DateTime.fromMillisecondsSinceEpoch(allVital[i].date).year,
          DateTime.fromMillisecondsSinceEpoch(allVital[i].date).month,
          DateTime.fromMillisecondsSinceEpoch(allVital[i].date).day);
      print(mapDate);
      if (!vital.containsKey(mapDate)) {
        vital[mapDate] = [allVital[i]];
        k++;
      } else if (allVital[i].date == allVital[i - 1].date) {
        vital[mapDate]!.add(allVital[i]);
      }

      print(vital[mapDate]);
    }
  }

  getSelectedVital(DateTime date) {
    DateTime eventDate = DateTime(date.year, date.month, date.day);
    getAllVitalFromDb();
    selectedVital = vital[eventDate]??[];
    update();
    return vital[eventDate] ?? [];
  }
}
