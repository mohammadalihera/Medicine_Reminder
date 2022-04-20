import 'package:Vitel/database/caching/cache.dart';
import 'package:get/get.dart';
class CacheController extends GetxController {
  
  changeFristDayOfWeek(String day){
    CacheService.instance.initFirstDayHive();
    
    CacheService.instance.firstDayOfWeek.put('firstDayOfWeek',day);
    update();
  }

  changeSkip(String skip){
    CacheService.instance.initSkipLoginHive();  
    CacheService.instance.skipLogin.put('skipLogin',skip);
    update();
  }

 
}
