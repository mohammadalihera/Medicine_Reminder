import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool signIn = false;
  void signedIn() {
    print('yes from controller');
    if (FirebaseAuth.instance.currentUser != null) {
      signIn = true;
    } else {
      signIn = false;
    }

    update();
  }
}
