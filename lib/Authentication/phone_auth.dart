import 'package:Vitals/controller/auth_user_controller.dart';
import 'package:Vitals/main.dart';
import 'package:Vitals/view/pages/home/home_page.dart';
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
    print(phone.toString() + "f1");
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final _codeController = TextEditingController();

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        print(phone.toString() + "f2");
        Navigator.of(context).pop();
        UserCredential result = await _auth.signInWithCredential(credential);
        User? user = result.user;
        if (user != null) {
          print(phone.toString() + "f3");
          print(user);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ),
          );
        } else {
          print('Error');
        }
      },
      verificationFailed: (FirebaseAuthException exception) {
        print(phone.toString() + "f4");
        print(exception);
      },
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
                    // textColor: Colors.white,
                    // color: Colors.purpleAccent,
                    onPressed: () async {
                      final code = _codeController.text.trim();
                      AuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: code,
                      );
                      // Navigator.of(context).pop();
                      UserCredential result =
                          await _auth.signInWithCredential(credential);
                      User? user = result.user;
                      if (user != null) {
                        print(user);
                        User? firebaseUser = FirebaseAuth.instance.currentUser;

                        // this means phone login
                        String username =
                            firebaseUser?.displayName.toString() ??
                                'Phone User';
                        String phoneNumber =
                            firebaseUser!.phoneNumber.toString();
                        print(phoneNumber);
                        String image =
                            'https://icon-library.com/images/cool-phone-icon/cool-phone-icon-20.jpg';

                        Get.find<AuthUserController>()
                            .updateVal(username, '', phoneNumber, image);

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => Dashboard()),
                            (Route<dynamic> route) => false);
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Dashboard(),
                        //   ),
                        // );
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
        print(verificationId);
      },
    );

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
