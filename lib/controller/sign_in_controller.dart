import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  // final user = FirebaseAuth.instance.currentUser;

  bool signIn = false;
  void signedIn(GoogleSignInAccount? user) {
    if (user != null) {
      print('found user: $user');
      signIn = true;
    } else {
      print('did not find user: $user');
      signIn = false;
    }
    update(); 
  }
}
