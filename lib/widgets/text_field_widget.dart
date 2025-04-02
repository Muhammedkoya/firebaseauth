import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  String hintText;
  IconData iconImage;
  TextEditingController textController;

  TextFieldWidget({
    required this.hintText,
    required this.iconImage,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: TextField(
        controller: textController,
        style: TextStyle(),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFedf0f8),
          prefixIcon: Icon(iconImage, size: 20, color: Colors.black54),
          hintText: hintText,
          //contentPadding: EdgeInsets.only(left: 200),
          hintStyle: TextStyle(color: Colors.black54),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: const Color.fromARGB(255, 58, 56, 188),
            ),
            borderRadius: BorderRadius.circular(35),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(35),
          ),
        ),
      ),
    );
  }
}
