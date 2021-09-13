import 'package:Vitals/Authentication/phone_auth.dart';
import 'package:Vitals/controller/countryCode/country_controller.dart';
import 'package:Vitals/main.dart';
import 'package:Vitals/model/countries.dart';
import 'package:Vitals/view/widgets/countryList/country_list.dart';
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

  final CountryController countryController = Get.put(
    CountryController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            margin: EdgeInsets.only(
              top: 30,
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Country',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppin',
                            fontWeight: FontWeight.normal,
                            color: kPrimaryColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        child: new FutureBuilder(
                          future: DefaultAssetBundle.of(context)
                              .loadString('data/country_code.json'),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<Country> counties =
                                  getCountryCode(snapshot.data.toString());
                              return new CountryList(
                                countries: counties,
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 30,
                            child: TextField(
                              controller: _phoneController,
                              onChanged: (text) {
                                text = text
                                    .replaceAll(" ", "")
                                    .replaceAll(".", "")
                                    .replaceAll(",", "")
                                    .replaceAll("-", "")
                                    .replaceAll("_", "");
                                if (_phoneController.text != text) {
                                  _phoneController.text = text;
                                  _phoneController.selection =
                                      TextSelection.fromPosition(
                                    TextPosition(
                                      offset: _phoneController.text.length,
                                    ),
                                  );
                                }
                                // setState(() {
                                //   _authController.sendButtonPress = false;
                                //   _authController.updateError('');
                                //   if (_phoneNumberController.text.length >= 7)
                                //     _validPhoneNumber = true;
                                //   else
                                //     _validPhoneNumber = false;
                                // });
                              },
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'AvenirNextCyr',
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                prefixText: '${countryController.phoneCode}',
                                prefixStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'AvenirNextCyr',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                                hintText: 'Phone number',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'AvenirNextCyr',
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(155, 172, 207, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            margin: EdgeInsets.only(
              top: 15,
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        hintText: 'Enter Your Phone Number (With Country Code)',
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

  List<Country> getCountryCode(String json) {
    List<dynamic> raw = convert.jsonDecode(json);
    return raw.map((e) => new Country.fromJson(e)).toList();
  }
}
