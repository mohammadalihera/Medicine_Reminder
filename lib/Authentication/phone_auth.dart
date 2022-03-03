import 'package:Vitel/controller/auth_user_controller.dart';
import 'package:Vitel/main.dart';
import 'package:Vitel/view/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PhoneAuth extends StatelessWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  Future<bool> phoneAuth(
      String phone, BuildContext context, String signCode) async {
    await Firebase.initializeApp();

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final _codeController = TextEditingController();

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();
        UserCredential result = await _auth.signInWithCredential(credential);
        User? user = result.user;
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ),
          );
        } else {}
      },
      verificationFailed: (FirebaseAuthException exception) {},
      codeSent: (String verificationId, [int? forceResendingToken]) {
        {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                backgroundColor: kPrimaryColor,
                title: Text(
                  'Enter The Code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    PinFieldAutoFill(
                      codeLength: 6,
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text('Confirm'),
                    onPressed: () async {
                      final code = _codeController.text.trim();
                      AuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: code,
                      );

                      UserCredential result =
                          await _auth.signInWithCredential(credential);
                      User? user = result.user;
                      if (user != null) {
                        User? firebaseUser = FirebaseAuth.instance.currentUser;

                        String username =
                            firebaseUser?.displayName.toString() ??
                                'Phone User';
                        String phoneNumber =
                            firebaseUser!.phoneNumber.toString();

                        String image =
                            'https://icon-library.com/images/cool-phone-icon/cool-phone-icon-20.jpg';

                        Get.find<AuthUserController>()
                            .updateVal(username, '', phoneNumber, image);

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => Dashboard()),
                            (Route<dynamic> route) => false);
                      } else {
                        print('Error');
                      }
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = verificationId;
      },
    );

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
