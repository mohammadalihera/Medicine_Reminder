import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController nameTextEditingController = TextEditingController();
  String _labelText;
  bool _isObsecure=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              margin: EdgeInsets.only(
                top: 30,
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
                          color: Colors.blue.shade200.withOpacity(0.5),
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 12, top: 15, right: 15),
                            hintText: 'Write your full name',hintStyle: TextStyle(color: Color(0xffC9C9C9).withOpacity(0.55))),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -4,
                    left: MediaQuery.of(context).size.width * 0.12,
                    child: Container(
                      width: 70,
                      height: 21,
                      color: Color(0xffEDF7FF),
                      child: Center(
                        child: Text(
                          'Full Name',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              )),
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
                          color: Colors.blue.shade200.withOpacity(0.5),
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 12, top: 15, right: 15),
                            hintText: 'Write you email ID',hintStyle: TextStyle(color: Color(0xffC9C9C9).withOpacity(0.55))),
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
                          'Email ID',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              )),
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
                          color: Colors.blue.shade200.withOpacity(0.5),
                        ),
                      ),
                      child: TextFormField(
                        obscureText: _isObsecure,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(icon: Icon(_isObsecure?Icons.visibility:Icons.visibility_off), onPressed:(){
                              setState(() {
                                _isObsecure=!_isObsecure;
                              });
                            }),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 12, top: 15, right: 15),
                            hintText: 'Password',hintStyle: TextStyle(color: Color(0xffC9C9C9).withOpacity(0.55))),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -4,
                    left: MediaQuery.of(context).size.width * 0.12,
                    child: Container(
                      width: 73,
                      height: 21,
                      color: Color(0xffEDF7FF),
                      child: Center(
                        child: Text(
                          'Password',
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
