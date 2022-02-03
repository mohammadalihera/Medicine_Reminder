import 'package:Vitel/database/vitel_reprository.dart';
import 'package:Vitel/model/medicine_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GetMedicineController extends GetxController {
  List<Vitel> selectedVitel = [];
  List<Vitel> allVitel = [];
  Map<DateTime, List<Vitel>> vitel = {};
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  void getAllVitelFromDb() async {
    vitel = {};
    allVitel = await Repository.getAllVitels();
    // allVital.sort((a, b) => a.date.compareTo(b.date));
    for (int i = 0; i < allVitel.length; ++i) {
      List<String> dbDates = allVitel[i].date.split(',');
      for (int j = 0; j < dbDates.length; ++j) {
        int dateInt = int.parse(dbDates[j]);
        DateTime mapDate = DateTime(
            DateTime.fromMillisecondsSinceEpoch(dateInt).year,
            DateTime.fromMillisecondsSinceEpoch(dateInt).month,
            DateTime.fromMillisecondsSinceEpoch(dateInt).day);
        if (!vitel.containsKey(mapDate)) {
          vitel[mapDate] = [allVitel[i]];
        } else {
          vitel[mapDate]!.add(allVitel[i]);
        }
      }
    }
    selectVitals(selectedDate);
    update();
  }

  getSelectedVital(DateTime date) {
    DateTime eventDate = DateTime(date.year, date.month, date.day);

    return vitel[eventDate] ?? [];
  }

  selectVitals(DateTime date) {
    DateTime eventDate = DateTime(date.year, date.month, date.day);
    selectedDate = eventDate;
    selectedVitel = vitel[eventDate] ?? [];

    update();
  }
}
