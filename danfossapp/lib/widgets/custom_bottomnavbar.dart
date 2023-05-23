import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

// ignore: must_be_immutable
class CustomNavBar extends StatefulWidget {
  final List<BarItem> baritems;
  late int selectedIndex;
  final void Function(int) ontap;
  CustomNavBar(
      {super.key,
      required this.baritems,
      required this.selectedIndex,
      required this.ontap});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return WaterDropNavBar(
      inactiveIconColor: Theme.of(context).colorScheme.outlineVariant,
      bottomPadding: MediaQuery.of(context).size.height / 30,
      iconSize: MediaQuery.of(context).size.width * 0.07,
      waterDropColor: Theme.of(context).colorScheme.onPrimary,
      selectedIndex: widget.selectedIndex,
      onItemSelected: widget.ontap,
      backgroundColor: Theme.of(context).colorScheme.primary,
      barItems: widget.baritems,
    );
  }
}
