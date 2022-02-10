import 'package:hive/hive.dart';
import 'package:get/get.dart';

class CacheService {
   CacheService._privateConstructor();

  static final CacheService instance = CacheService._privateConstructor();

  
  late Box<String> firstDayOfWeek;

  initFirstDayHive() {
    firstDayOfWeek = Hive.box<String>('firstDayOfWeek');
  }
  

}
