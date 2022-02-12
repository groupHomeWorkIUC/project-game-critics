import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';

class CustomInputField extends StatefulWidget {
  final String? inputFieldText;
  final IconData inputFieldIcon;
  final TextEditingController? controller;
  final String? initialValue;
  const CustomInputField({Key? key, this.initialValue, required this.inputFieldText, required this.inputFieldIcon, this.controller}) : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            Get.snackbar("Empty fields", "Please fill all input fields");
            return null;
          }
          return null;
        },
        style: TextStyle(color: DarkThemeColors.secondaryTextColor, fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.inputFieldText,
          icon: Icon(
            widget.inputFieldIcon,
            color: Theme.of(Get.context!).iconTheme.color,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
