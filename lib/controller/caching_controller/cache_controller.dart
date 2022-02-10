import 'package:Vitel/database/caching/cache.dart';
import 'package:get/get.dart';
class CacheController extends GetxController {
  //final TaskController taskC = Get.put(TaskController());
  //CacheService._privateConstructor();
  //static final CacheService instance = CacheService._privateConstructor();
  
  changeFristDayOfWeek(String day){
    CacheService.instance.initFirstDayHive();
    
    CacheService.instance.firstDayOfWeek.put('firstDayOfWeek',day);
    update();
  }

 
}
