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
    vital = {};
    allVital = await Repository.getAllVitals();
    // allVital.sort((a, b) => a.date.compareTo(b.date));
    for (int i = 0; i < allVital.length; ++i) {
      List<String> dbDates = allVital[i].date.split(',');
      for (int j = 0; j < dbDates.length; ++j) {
        int dateInt = int.parse(dbDates[j]);
        DateTime mapDate = DateTime(
            DateTime.fromMillisecondsSinceEpoch(dateInt).year,
            DateTime.fromMillisecondsSinceEpoch(dateInt).month,
            DateTime.fromMillisecondsSinceEpoch(dateInt).day);

        if (!vital.containsKey(mapDate)) {
          vital[mapDate] = [allVital[i]];
        } else {
          vital[mapDate]!.add(allVital[i]);
        }
      }
    }
    selectVitals(selectedDate);
    update();
  }

  getSelectedVital(DateTime date) {
    DateTime eventDate = DateTime(date.year, date.month, date.day);

    // print(eventDate);
    selectedDate = eventDate;
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
