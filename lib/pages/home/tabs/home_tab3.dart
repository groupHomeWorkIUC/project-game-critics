import 'package:flutter/material.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';

class HomeTab3 extends StatefulWidget {
  const HomeTab3({Key? key}) : super(key: key);

  @override
  _HomeTab3State createState() => _HomeTab3State();
}

class _HomeTab3State extends State<HomeTab3> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Text('Page 3'),
        ),
      ),
    );
  }
}
