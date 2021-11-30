import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/home_page_controller.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/models/company.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/models/image.dart';
import 'package:project_game_critics/pages/home/tabs/home_tab1.dart';
import 'package:project_game_critics/pages/home/tabs/home_tab2.dart';
import 'package:project_game_critics/pages/home/tabs/home_tab3.dart';
import 'package:project_game_critics/widgets/custom_bottom_navbar/custom_bottom_navbar.dart';
import 'package:project_game_critics/widgets/home_news_listview.dart';
import 'package:project_game_critics/widgets/input_field.dart';
import 'package:project_game_critics/widgets/title_and_more_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late List<Widget> tabBarPages;

  @override
  void initState() {
    super.initState();
    tabController = NoAnimationTabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                HomeTab1(),
                HomeTab2(),
                HomeTab3(),
              ]),
          Positioned(
            bottom: 0,
            left: 60,
            right: 60,
            child: CustomBottomNavBar(
              iconButtons: [
                buildIconButtonWithLabel(
                    iconData: Icons.home,
                    onPressed: () {
                      tabController.animateTo(0);
                    }),
                buildIconButtonWithLabel(
                    iconData: Icons.article,
                    onPressed: () {
                      tabController.animateTo(1);
                    }),
                buildIconButtonWithLabel(
                    iconData: Icons.gamepad,
                    onPressed: () {
                      tabController.animateTo(2);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        'Game Critics',
        style: Theme.of(Get.context!).textTheme.headline4,
      ),
    );
  }

  buildIconButtonWithLabel(
      {required IconData iconData, required Function() onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(iconData),
      color: Colors.white,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    );
  }
}

class NoAnimationTabController extends TabController {
  NoAnimationTabController(
      {int initialIndex = 0,
      required int length,
      required TickerProvider vsync})
      : super(initialIndex: initialIndex, length: length, vsync: vsync);

  @override
  void animateTo(int value,
      {Duration duration = kTabScrollDuration, Curve curve = Curves.ease}) {
    super.animateTo(value,
        duration: const Duration(milliseconds: 0), curve: curve);
  }
}
