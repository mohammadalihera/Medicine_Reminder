import 'package:flutter/material.dart';

// import 'package:flutter_svg/svg.dart';
class BottomNav extends StatelessWidget {
  final PageController pageController;

  final int currentIndex;

  const BottomNav(this.pageController, this.currentIndex);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      child: Container(
        color: Colors.blue,
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
                            duration: Duration(milliseconds: 50),
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
                          duration: Duration(milliseconds: 50),
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
                          duration: Duration(milliseconds: 50),
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
                          duration: Duration(milliseconds: 50),
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
                          duration: Duration(milliseconds: 50),
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
                            duration: Duration(milliseconds: 50),
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
    );
  }
}
