import 'package:MedicineReminder/view/pages/dashboard.dart';
import 'package:MedicineReminder/view/pages/user_page.dart';
import 'package:MedicineReminder/view/pages/setting_page.dart';
import 'package:MedicineReminder/view/widgets/dashboard_widget/new_medicine_detail/new_medicine_detail.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MedicineReminder/view/widgets/home/bottom_nav.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBack(
        message: 'Press back again to close',
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 10;
  int currentIndex = 1;

  PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
    viewportFraction: 1,
  );

  setCurrentPage(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Positioned(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (value) => {setCurrentPage(value)},
                      children: [
                        UserPage(),
                        DashBoard(currentIndex),
                        SettingsPage()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
               height: 50,
               width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  // alignment: Alignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: <Widget>[
                    currentIndex == 0
                        ? Container(
                            child: InkWell(
                              onTap: () {
                                pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 10),
                                    curve: Curves.bounceIn);
                              },
                              child: Container(
                                child: Icon(
                                  Icons.account_box,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            child: InkWell(
                            onTap: () {
                              pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.bounceIn);
                            },
                            child: Container(
                              child: Icon(
                                Icons.account_box,
                                color: Colors.black,
                              ),
                            ),
                          )),

                    // Task Icon
                    currentIndex == 1
                        ? Container(
                            child: InkWell(
                            onTap: () {
                              pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.bounceIn);
                            },
                            child: Container(
                              child: Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                            ),
                          ))
                        : Container(
                            child: InkWell(
                            onTap: () {
                              pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.bounceIn);
                            },
                            child: Container(
                              child: Icon(
                                Icons.home,
                                color: Colors.black,
                              ),
                            ),
                          )),

                    //Chat Icon--------------------------------------------
                    currentIndex == 2
                        ? Container(
                            child: InkWell(
                            onTap: () {
                              pageController.animateToPage(2,
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.bounceIn);
                            },
                            child: Container(
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                            ),
                          ))
                        : Container(
                            child: InkWell(
                              onTap: () {
                                pageController.animateToPage(2,
                                    duration: Duration(milliseconds: 10),
                                    curve: Curves.bounceIn);
                              },
                              child: Container(
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          currentIndex == 1
              ? Positioned(
                  //left: MediaQuery.of(context).size.width * 0.42,
                  bottom: 14,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Container(
                        height: 75,
                        width: 75,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(75),
                          ),
                          color: Color(0xffEDF7FF),
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.16,
                          width: MediaQuery.of(context).size.width * 0.16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(70),
                            ),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: InkWell(
                                onTap: addMedicine,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(height: 0)
        ],
      ),
    );
  }

  void addMedicine() {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.78,
            decoration: new BoxDecoration(
              color: Color(0xffEDF7FF),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(35.0),
                topRight: const Radius.circular(35.0),
              ),
            ),
            child: NewMedicineDetail(),
          );
        });
  }
}
