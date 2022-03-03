import 'package:Vitel/controller/add_medicine/add_medicine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicineInfoTextField extends StatefulWidget {
  String type;
  final String vitelName;
  MedicineInfoTextField({required this.type,required this.vitelName});

  @override
  _MedicineInfoTextFieldState createState() => _MedicineInfoTextFieldState();
}

class _MedicineInfoTextFieldState extends State<MedicineInfoTextField> {
  TextEditingController editingController = new TextEditingController();
  AddMedicineController addmedicineController =
      Get.put(AddMedicineController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 40,
        right: 30,
      ),
      child: TextField(
        onEditingComplete: () {
        
        },
        onChanged: (text) {
         
          Get.find<AddMedicineController>().changeName(text);
        },
        onSubmitted: (text) {
         
          Get.find<AddMedicineController>().changeName(text);
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
          fontFamily: 'Poppins',
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText:widget.vitelName==''? widget.type:widget.vitelName,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.grey,
            fontSize: 18,
          ),
          counterText: '',
        ),
      ),
    );
  }
}
