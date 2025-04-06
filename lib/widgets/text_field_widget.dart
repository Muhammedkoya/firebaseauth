import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  String hintText;
  IconData? iconImage;
  TextEditingController textController;
  bool ispass;
  String labelText;
  bool isFocussedBorder;
  bool isBorderCircular;
  bool isBorderPresent;

  TextFieldWidget({
    required this.hintText,
    required this.iconImage,
    required this.textController,
    this.ispass = false,
    this.labelText = "",
    this.isFocussedBorder = true,
    this.isBorderCircular = true,
    this.isBorderPresent = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      obscureText: ispass,
      style: TextStyle(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFedf0f8),
        //prefixIcon: Icon(iconImage, size: 20, color: Colors.black54),
        prefixIcon:
            (iconImage != null)
                ? Icon(iconImage, size: 20, color: Colors.black54)
                : null, // Ret
        hintText: hintText,
        labelText: labelText,
        //contentPadding: EdgeInsets.only(left: 200),
        hintStyle: TextStyle(color: Colors.black54),
        border: InputBorder.none,
        focusedBorder:
            (isFocussedBorder)
                ? OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: const Color.fromARGB(255, 58, 56, 188),
                  ),
                  borderRadius: BorderRadius.circular(35),
                )
                : OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              (isBorderPresent)
                  ? BorderSide(width: 1, color: Colors.black)
                  : BorderSide.none,
          borderRadius:
              (isBorderCircular)
                  ? BorderRadius.circular(35)
                  : BorderRadius.circular(5),
        ),
      ),
    );
  }
}
