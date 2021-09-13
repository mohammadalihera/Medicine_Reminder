import 'package:Vitals/controller/countryCode/country_controller.dart';
import 'package:Vitals/main.dart';
import 'package:Vitals/model/countries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryList extends StatelessWidget {
  final CountryController countryController = Get.put(CountryController());
  final List<Country> countries;
  final Map<String, String> codes = new Map();

  CountryList({Key? key, required this.countries}) : super(key: key) {
    for (int i = 0; i < countries.length; ++i) {
      codes[countries[i].name] = countries[i].phoneCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Color.fromRGBO(28, 38, 51, 1),
      value: '${countryController.country}',
      icon: Icon(Icons.keyboard_arrow_down),
      iconSize: 20,
      elevation: 16,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Poppin',
        fontWeight: FontWeight.normal,
        color: kPrimaryColor,
      ),
      onChanged: (String? value) {
        String? code = codes[value];
        countryController.phoneCode = code!;
        countryController.country = value!;
      },
      underline: Container(
        height: 0.0,
      ),
      items: countries.map<DropdownMenuItem<String>>((Country value) {
        return DropdownMenuItem<String>(
          value: value.name,
          child: Container(
            padding: EdgeInsets.only(top: 2, bottom: 2, left: 2),
            child: Row(
              children: <Widget>[
                Text(
                  value.flag,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppin',
                    fontWeight: FontWeight.normal,
                    color: kPrimaryColor,
                  ),
                ),
                Container(
                  width: 10,
                ),
                Text(
                  value.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppin',
                    fontWeight: FontWeight.normal,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
