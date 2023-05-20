import 'package:danfossapp/screens/about_us.dart';
import 'package:danfossapp/screens/feedback_screens.dart';
import 'package:danfossapp/settings/settings.dart';
import 'package:danfossapp/widgets/custom_bottomnavbar.dart';
import 'package:danfossapp/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final _buildBody = const <Widget>[
    HomeWidget(),
    FeedBack(),
    AboutUs(),
    MySettings()
  ];

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        bottomNavigationBar: CustomNavBar(baritems: [
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
              filledIcon: Icons.feedback,
              outlinedIcon: Icons.feedback_outlined),
          BarItem(filledIcon: Icons.group, outlinedIcon: Icons.group_outlined),
          BarItem(
              filledIcon: Icons.settings, outlinedIcon: Icons.settings_outlined)
        ], selectedIndex: selectedIndex, ontap: onTap),
        body: IndexedStack(
          index: selectedIndex,
          children: _buildBody,
        ));
  }
}
