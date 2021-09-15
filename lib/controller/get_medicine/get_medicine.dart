import 'package:Vitals/database/vital_reprository.dart';
import 'package:Vitals/model/medicine_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GetMedicineController extends GetxController {
  List<Vital> selectedVital = [];
  List<Vital> allVital = [];
  void getAllVitalFromDb() async {
    allVital = await Repository.getAllVitals();
  }

  List<Vital> getSelectedVital(DateTime date) {
    print(date);
    getAllVitalFromDb();
    List<Vital> selectedVital = [];
    for (int i = 0; i < allVital.length; ++i) {
      if (DateTime.fromMillisecondsSinceEpoch(allVital[i].date).day ==
              date.day &&
          DateTime.fromMillisecondsSinceEpoch(allVital[i].date).month ==
              date.month &&
          DateTime.fromMillisecondsSinceEpoch(allVital[i].date).year ==
              date.year) {
        print('added');
        selectedVital.add(allVital[i]);
      } else {
        print('failed');
        print(DateTime.fromMillisecondsSinceEpoch(allVital[i].date));
        print(date);
      }
    }
    print(selectedVital);
     update();
    return selectedVital;
   
  }
}
