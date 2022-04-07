import 'package:Vitel/controller/add_medicine/add_medicine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicineInfoTextField extends StatefulWidget {
  String type;
  final String vitelName;
  MedicineInfoTextField({required this.type, required this.vitelName});

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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: addmedicineController.addmedicine &&
                  addmedicineController.name.isEmpty
              ? Border.all(color: Colors.red)
              : null),
      margin: EdgeInsets.only(
        left: 40,
        right: 30,
      ),
      child: TextFormField(
        //maxLengthEnforcement: MaxLengthEnforcement.none,
        validator: (value) {
          if (value != '') {
            return "Please enter a medicine name";
          }
          return null;
        },
        onEditingComplete: () {},
        onChanged: (text) {
          Get.find<AddMedicineController>().changeName(text);
        },
        onSaved: (text) {
          Get.find<AddMedicineController>().changeName(text.toString());
          addmedicineController.addmedicine = false;
        },

        enabled: true,
        minLines: 1,
        maxLines: 5,
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
          hintText: widget.vitelName == '' ? widget.type : widget.vitelName,
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
