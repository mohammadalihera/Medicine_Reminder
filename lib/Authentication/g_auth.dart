import 'package:Vitel/view/pages/sign_up/sign_up.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  return _user.toString();
}

Future logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => SignUpPage()),
      (Route<dynamic> route) => false);
}
