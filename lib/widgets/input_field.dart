import 'package:flutter/material.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';

class CustomInputField extends StatefulWidget {
  final String? inputFieldText;
  final IconData inputFieldIcon;
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
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: DarkThemeColors.secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(
            color: DarkThemeColors.greyTextColor, fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.inputFieldText,
          icon: Icon(
            widget.inputFieldIcon,
            color: DarkThemeColors.greyTextColor,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
