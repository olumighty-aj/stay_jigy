import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stay_jigy/data/model/nav_button_data.dart';
import 'package:stay_jigy/pages/home/home_page.dart';
import 'package:stay_jigy/pages/profile/profile_page.dart';
import 'package:stay_jigy/pages/report/reports_page.dart';
import 'package:stay_jigy/shared/color.dart';
import 'package:stay_jigy/shared/route.dart';

class BottomNavBar extends StatefulWidget {
  final ScreenArguments newArgu;
  const BottomNavBar({Key? key, required this.newArgu}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController controller = PageController();

  int selectBtn = 0;
  bool isJump = false;
  @override
  void initState() {
    setState(() {
      selectBtn = widget.newArgu.index;
      isJump = widget.newArgu.isJump;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomMenu[selectBtn],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: white,
        color: blue.withOpacity(0.4),
        buttonBackgroundColor: blue,
        height: 60,
        index: selectBtn,
        items: <Widget>[
          for (var button in navButtons)
            Icon(
              _getIconData(button.unselectImage),
              size: 30,
              color: white,
            )
        ],
        onTap: (index) {
          setState(() {
            selectBtn = index;
            isJump = false;
          });
        },
      ),
    );
  }
}

IconData _getIconData(String imagePath) {
    switch (imagePath) {
      case 'assets/icons/home_outline.png':
        return Icons.home;
      case 'assets/icons/report_line.png':
        return Icons.bar_chart;
      case 'assets/icons/user_line.png':
        return Icons.person;
      default:
        return Icons.error;
    }
  }

List<Widget> bottomMenu = [
  const HomePage(),
  const ReportsPage(),
  const ProfilePage(),
];
