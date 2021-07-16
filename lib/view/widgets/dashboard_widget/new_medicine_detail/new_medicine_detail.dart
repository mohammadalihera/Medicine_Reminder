import 'package:MedicineReminder/view/widgets/dashboard_widget/new_medicine_detail/medicine_info_text_field.dart';
import 'package:flutter/material.dart';

class NewMedicineDetail extends StatefulWidget {
  @override
  _NewMedicineDetailState createState() => _NewMedicineDetailState();
}

class _NewMedicineDetailState extends State<NewMedicineDetail> {
  TextEditingController editingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 40, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add New Medicine',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 40),
                    child: Icon(
                      Icons.close,
                      color: Colors.green.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 40, top: 30),
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              MedicineInfoTextField(type:'Medicine Name'),
              Container(
                  margin: EdgeInsets.only(left: 40, top: 10),
                  child: Text(
                    'Dose',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              MedicineInfoTextField(type:'How many dose'),
              Container(
                  margin: EdgeInsets.only(left: 40, top: 30),
                  child: Text(
                    'Quantity',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              MedicineInfoTextField(type:'Quantity'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
