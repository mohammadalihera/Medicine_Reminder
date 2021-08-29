import 'package:MedicineReminder/view/widgets/dashboard_widget/new_medicine_detail/meal/after_meal.dart';
import 'package:flutter/material.dart';

class MedicineInfoTile extends StatefulWidget {
  @override
  _MedicineInfoTileState createState() => _MedicineInfoTileState();
}

class _MedicineInfoTileState extends State<MedicineInfoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom:50),
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: 20,
          itemBuilder: (_, i) {
            return Card(
              shadowColor: Colors.blue,
              elevation: 4,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                color: Color(0xffEDF7FF).withOpacity(0.2),
                width: 4,
              ),
                borderRadius: BorderRadius.circular(25),
              ),
              color: Color(0xffEDF7FF),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 6),
                      child: Text(
                        'Medicine Name',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue),
                      ),
                    ),
                    AfterMeal('after', 'dash'),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        '3 times today',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Upcoming Dose',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '09:00PM',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff606365)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
