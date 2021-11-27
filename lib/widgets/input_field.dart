import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String? inputFieldText;
  final Icon inputFieldIcon;
  const CustomInputField(
      {Key? key, required this.inputFieldText, required this.inputFieldIcon})
      : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: const Color(0xff151515),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.inputFieldText,
          hintStyle: const TextStyle(
            color: Color(0xff707070),
          ),
          icon: widget.inputFieldIcon,
        ),
      ),
    );
  }
}
