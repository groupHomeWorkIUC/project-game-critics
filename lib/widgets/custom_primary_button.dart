import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final GlobalKey? globalKey;
  const PrimaryButton({Key? key, required this.text, required this.onPressed, this.globalKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 45, width: double.infinity),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(Get.context!).textTheme.button,
        ),
      ),
    );
  }
}
