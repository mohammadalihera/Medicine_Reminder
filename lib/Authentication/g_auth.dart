import 'package:Vitals/controller/sign_in_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignIn = GoogleSignIn();

GoogleSignInAccount? _user;

GoogleSignInAccount get user => _user!;

Future googleLogin() async {
  final googleUser = await googleSignIn.signIn();

  if (googleUser == null) return;
  _user = googleUser;

  final googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  await FirebaseAuth.instance.signInWithCredential(credential);

  print('signInWithGoogle succeeded: $_user');
}

Future logout() async {
  await googleSignIn.disconnect();
  FirebaseAuth.instance.signOut();
}
