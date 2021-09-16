import 'package:Vitals/Authentication/phone_auth.dart';
import 'package:Vitals/main.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final _phoneController = TextEditingController();

  PhoneAuth phoneAuthInstance = new PhoneAuth();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            // decoration: BoxDecoration(
            //   border: Border.all(color: kPrimaryColor),
            // ),
            height: 85,
            margin: EdgeInsets.only(
              top: 30,
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.085,
                        ),
                        child: Text(
                          'Select Country',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            color: kPrimaryColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: kPrimaryColor),
                        // ),
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.025,
                        ),
                        child: CountryCodePicker(
                          initialSelection: 'BD',
                          showCountryOnly: true,
                          showDropDownButton: true,
                          showOnlyCountryWhenClosed: true,
                          backgroundColor: kPrimaryColor.withOpacity(0.2),
                          barrierColor: kPrimaryColor.withOpacity(0.2),
                          dialogBackgroundColor: kPrimaryColor.withOpacity(0.9),
                          textOverflow: TextOverflow.ellipsis,
                          textStyle: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                          dialogSize: Size(
                            MediaQuery.of(context).size.width * .8,
                            MediaQuery.of(context).size.height * 0.9,
                          ),
                          dialogTextStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                          hideSearch: true,
                          alignLeft: true,
                          onChanged: (countryCode) {
                            print(countryCode);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            margin: EdgeInsets.only(
              top: 50,
              // 15
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 7,
                  left: MediaQuery.of(context).size.width * 0.097,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        color: kPrimaryColor,
                      ),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 12, top: 12, right: 15),
                        hintText: 'Enter Your Phone Number',
                        hintStyle: TextStyle(
                          color: Color(0xffC9C9C9),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -4,
                  left: MediaQuery.of(context).size.width * 0.12,
                  child: Container(
                    width: 65,
                    height: 21,
                    color: Color(0xffEDF7FF),
                    child: Center(
                      child: Text(
                        'Number',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          InkWell(
            onTap: () {
              final phone = _phoneController.text.trim();
              print(phone.toString());
              phoneAuthInstance.phoneAuth(phone, context);
              print(phone.toString());
            },
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
                'Get OTP',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
