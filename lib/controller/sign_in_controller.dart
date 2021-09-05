import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool signedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    }

    update();
    return false;
  }
}
