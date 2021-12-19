import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<Widget> iconButtons;
  const CustomBottomNavBar({Key? key, required this.iconButtons})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.red,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: iconButtons,
      ),
    );
  }
}
