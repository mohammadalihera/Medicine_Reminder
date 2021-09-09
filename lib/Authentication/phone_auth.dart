import 'package:Vitals/main.dart';
import 'package:Vitals/view/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatelessWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  Future<bool> phoneAuth(String phone, BuildContext context) async {
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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
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
                      TextField(
                        controller: _codeController,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text('Confirm'),
                      // textColor: Colors.white,
                      // color: Colors.purpleAccent,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId, smsCode: code);
                        UserCredential result =
                            await _auth.signInWithCredential(credential);
                        User? user = result.user;
                        if (user != null) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
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
        codeAutoRetrievalTimeout: (String verificationId) {});

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
