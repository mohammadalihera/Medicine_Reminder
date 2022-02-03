import 'package:Vitel/controller/sign_in_controller.dart';
import 'package:Vitel/view/pages/sign_up/sign_up.dart';
import 'package:Vitel/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignIn = GoogleSignIn();

GoogleSignInAccount? _user;

GoogleSignInAccount get user => _user!;

Future<String> googleLogin() async {
  final googleUser = await googleSignIn.signIn();

  if (googleUser == null) return '';
  _user = googleUser;

  final googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  await FirebaseAuth.instance.signInWithCredential(credential);
  print('signInWithGoogle succeeded: $_user');
  // Get.to(main());\

  return _user.toString();
}

Future logout(BuildContext context) async {
  // await googleSignIn.disconnect();
  await FirebaseAuth.instance.signOut();
  print('loggin out');
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => SignUpPage()),
      (Route<dynamic> route) => false);
  // Navigator.of(context).pushReplacement(
  //   MaterialPageRoute(
  //     fullscreenDialog: true,
  //     builder: (context) {
  //       return SignUpPage();
  //     },
  //   ),
  // );
  // Get.to(SignUpPage());
}
