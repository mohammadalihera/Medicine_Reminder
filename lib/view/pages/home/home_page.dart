import 'package:Vitel/main.dart';
import 'package:Vitel/view/pages/dashboard.dart';
import 'package:Vitel/view/pages/setting_page.dart';
import 'package:Vitel/view/pages/user_page.dart';
import 'package:Vitel/view/widgets/dashboard_widget/new_medicine_detail/new_medicine_detail.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  late double displayHeight;

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
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Positioned(
            // navigation setup
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
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
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
                            width: 40,
                            child: InkWell(
                              onTap: () {
                                pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 0),
                                    curve: Curves.bounceOut);
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  "assets/images/profile.svg",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: 40,
                            child: InkWell(
                              onTap: () {
                                pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.slowMiddle);
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  "assets/images/profile.svg",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          ),

                    // Dashboard Page
                    currentIndex == 1
                        ? Container(
                            width: 40,
                            child: InkWell(
                              onTap: () {
                                pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.slowMiddle);
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  "assets/images/home.svg",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: 40,
                            child: InkWell(
                              onTap: () {
                                pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.slowMiddle);
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  "assets/images/home.svg",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          ),

                    //Settings Page--------------------------------------------
                    currentIndex == 2
                        ? Container(
                            width: 40,
                            child: InkWell(
                              onTap: () {
                                pageController.animateToPage(2,
                                    duration: Duration(milliseconds: 0),
                                    curve: Curves.linear);
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  "assets/images/settings.svg",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ))
                        : Container(
                            width: 40,
                            child: InkWell(
                              onTap: () {
                                pageController.animateToPage(2,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.slowMiddle);
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  "assets/images/settings.svg",
                                  height: 20,
                                  width: 20,
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
                      child: Stack(
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(75),
                              ),
                              color: Color(0xffEDF7FF),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            left: 5,
                            child: Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(70),
                                ),
                                color: kPrimaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 5,
                                    spreadRadius: 2,
                                    offset: Offset(6, 6),
                                    // Shadow position
                                  ),
                                ],
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
                        ],
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
    late double modalHeight;
    if (displayHeight < 700) {
      modalHeight = MediaQuery.of(context).size.height * 0.9;
    }
    if (displayHeight > 700 && displayHeight < 750) {
      modalHeight = modalHeight = MediaQuery.of(context).size.height * 0.87;
      //modalHeight = modalHeight = MediaQuery.of(context).size.height * 0.7;
    }
    if (displayHeight > 750) {
      modalHeight = modalHeight = MediaQuery.of(context).size.height * 0.75;
      //modalHeight = modalHeight = MediaQuery.of(context).size.height * 0.7;
      // responsive modal implementation
    }
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: modalHeight,
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
