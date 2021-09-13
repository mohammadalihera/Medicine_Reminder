import 'package:get/get.dart';

class CountryController extends GetxController {
  var _phoneCode = '+880 '.obs;
  var _country = 'Bangladesh'.obs;

  String get phoneCode => _phoneCode.toString();

  set phoneCode(String code) {
    _phoneCode.update((value) {
      _phoneCode.value = code + ' ';
    });
  }

  String get country => _country.toString();

  set country(String country) {
    _country.update((value) {
      _country.value = country;
    });
  }
}
