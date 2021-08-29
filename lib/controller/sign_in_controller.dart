import 'package:get/get.dart';

class SignInController extends GetxController {
  
  bool signIn = false;

  

  void signedIn(bool sign) {
    signIn=sign;
    update();
  }
}
