import 'package:flutter/material.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';

class HomeTab2 extends StatefulWidget {
  const HomeTab2({Key? key}) : super(key: key);

  @override
  _HomeTab2State createState() => _HomeTab2State();
}

class _HomeTab2State extends State<HomeTab2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(child: Text('Page 2'),),
      ),
    );
  }
}
