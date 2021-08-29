import 'package:flutter/material.dart';

class MedicineInfoTextField extends StatefulWidget {
  String type;
  MedicineInfoTextField({this.type});

  @override
  _MedicineInfoTextFieldState createState() => _MedicineInfoTextFieldState();
}

class _MedicineInfoTextFieldState extends State<MedicineInfoTextField> {
  TextEditingController editingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 40,
        right: 30,
      ),
      child: TextField(
        onEditingComplete: () {
          print('Name');
        },
        onChanged: (text) {
          print(text.length);
        },
        onSubmitted: (text) {
          print(text.length);
        },
        enabled: true,
        minLines: 1,
        maxLines: 5,
        maxLengthEnforced: false,
        keyboardType: TextInputType.text,
        autofocus: false,
        cursorColor: Colors.black,
        cursorHeight: 20,
        controller: editingController,
        style: TextStyle(
          fontFamily: "AvenirNextCyr",
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: widget.type,
          hintStyle: TextStyle(
            fontFamily: "AvenirNextCyr",
            color: Colors.grey,
            fontSize: 18,
          ),
          counterText: '',
        ),
      ),
    );
  }
}
