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
    for (int i = 0; i < allVital.length; ++i) {
      // print('----------------------------++++++++++++++++++++++++++++++');
      // print(allVital[i].name);
      DateTime mapDate = DateTime(
          DateTime.fromMillisecondsSinceEpoch(allVital[i].date).year,
          DateTime.fromMillisecondsSinceEpoch(allVital[i].date).month,
          DateTime.fromMillisecondsSinceEpoch(allVital[i].date).day);
      //print(mapDate);
      if (!vital.containsKey(mapDate)) {
        vital[mapDate] = [allVital[i]];
      } else if (allVital[i].date == allVital[i].date) {
        vital[mapDate]!.add(allVital[i]);
      }

      // print(vital[mapDate]);
    }
    selectVitals(selectedDate);
    update();
  }

  getSelectedVital(DateTime date) {
    DateTime eventDate = DateTime(date.year, date.month, date.day);

    print(eventDate);
    // selectedDate = eventDate;
    getAllVitalFromDb();

    return vital[eventDate] ?? [];
  }

  selectVitals(DateTime date) {
    DateTime eventDate = DateTime(date.year, date.month, date.day);
    selectedDate = eventDate;
    selectedVital = vital[eventDate] ?? [];

    update();
  }
}
