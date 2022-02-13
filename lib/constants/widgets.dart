import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstantWidgets {
  static var circularProgressIndicator = SizedBox(
    height: double.infinity,
    child: Center(
      child: CircularProgressIndicator(
        color: Theme.of(Get.context!).primaryColor,
      ),
    ),
  );
}
