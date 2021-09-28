import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthUserController extends GetxController {
  // final user = FirebaseAuth.instance.currentUser;
  String userName = '';
  String userEmail = '';
  String userPhone = '';
  String imageURL = '';

  void updateVal(String name, String email, String phone, String imgURL) {
    userName = name;
    userEmail = email;
    userPhone = phone;
    imageURL = imgURL;

    // print('------------------------------------------------------------------');
    // print(userPhone);

    update();
  }
}
