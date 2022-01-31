import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function onTap;
  const CustomButton(
      {required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Function func = onTap;
    return TextButton(
      onPressed: onTap(),
      child: Container(
          margin: EdgeInsets.only(left: 20, bottom: 40),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap:onTap(),
                child: Container(
                  child: Text(text,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          )),
    );
  }
}
