import 'package:hive/hive.dart';
import 'package:get/get.dart';

class CacheService {
   CacheService._privateConstructor();

  static final CacheService instance = CacheService._privateConstructor();

  
  late Box<String> firstDayOfWeek;
  late Box<String> skipLogin;

  initFirstDayHive() {
    firstDayOfWeek = Hive.box<String>('firstDayOfWeek');
  }

  initSkipLoginHive() {
    skipLogin = Hive.box<String>('skipLogin');
  }
  

}
