import 'package:MedicineReminder/controller/sign_in_controller.dart';
import 'package:MedicineReminder/view/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:MedicineReminder/view/widgets/sign_up_widget/sign_up_text_fields.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignInController signInController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEDF7FF),
        actions: [
          InkWell(
            onTap: null,
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    'Skip',
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                  Icon(
                    Icons.arrow_right_alt_sharp,
                    color: Colors.blue,
                    size: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: Color(0xffEDF7FF),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Center(
                child: Container(
                  //margin: EdgeInsets.only(top:40),
                  child: Text(
                    'Sign up to get Started',
                    style: TextStyle(
                        color: Color(0xff606365).withOpacity(0.6),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              TextFieldWidget(),
              SizedBox(height: 30),
              InkWell(
                onTap: () => Get.find<SignInController>().signedIn(true),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue,
                  ),
                  margin: EdgeInsets.only(left: 33, right: 33),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.blue.shade200.withOpacity(0.5),
                  ),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        "assets/google 1.svg",
                      ),
                    ),
                    SizedBox(width:10),
                    Center(
                      child: Text(
                        'Sign up with Google',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
