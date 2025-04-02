import 'package:flutter/material.dart';

class FooterWidget extends StatefulWidget {
  String footerHeading1;
  String footerHeading2;
  Widget targetPage;
  //bool isHovered = false;

  FooterWidget({
    required this.footerHeading1,
    required this.footerHeading2,
    required this.targetPage,
  });

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.footerHeading1, style: TextStyle(color: Colors.grey[800])),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return widget.targetPage;
                },
              ),
            );
          },
          child: MouseRegion(
            onEnter: (_) {
              setState(() {
                isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                isHovered = false;
              });
            },
            child: Text(
              widget.footerHeading2,
              style: TextStyle(
                color: isHovered ? Colors.blue : Colors.black,
                decoration: TextDecoration.underline,
                decorationColor: isHovered ? Colors.blue : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
