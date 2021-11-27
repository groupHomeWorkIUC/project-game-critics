import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  const PrimaryButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints.tightFor(height: 45, width: double.infinity),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(widget.text),
      ),
    );
  }
}
