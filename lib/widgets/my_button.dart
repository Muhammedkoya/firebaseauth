import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String displayText;
  GestureTapCallback buttonAction;

  MyButton({required this.displayText, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonAction,
      child: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              displayText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
