import 'package:danfossapp/components/Hydro/hydro_baseline.dart';
import 'package:danfossapp/components/Hydro/hydro_optimise.dart';
import 'package:danfossapp/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '../../widgets/custom_checkbox.dart';

class HydroPage extends StatefulWidget {
  const HydroPage({super.key});

  @override
  State<HydroPage> createState() => _HydroPageState();
}

class _HydroPageState extends State<HydroPage> {
  bool hydroMetricBool = true;
  List<Widget> buildBody = [];
  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _onTapHydroMetric(bool? newValue) {
    setState(() {
      hydroMetricBool = newValue!;
    });
  }

  @override
  void initState() {
    buildBody = [HydroBaseline(), HydroOptimise()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: CustomFloatingActionButton(children: [
        FloatingActionButton.extended(
            heroTag: null,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            onPressed: () {},
            label: CustomCheckBox(
                ontap: _onTapHydroMetric,
                value: hydroMetricBool,
                label: 'Metric')),
      ]),
      bottomNavigationBar: WaterDropNavBar(
        iconSize: MediaQuery.of(context).size.width * 0.08,
        waterDropColor: Theme.of(context).colorScheme.onPrimary,
        selectedIndex: selectedIndex,
        onItemSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        barItems: [
          BarItem(filledIcon: Icons.grain, outlinedIcon: Icons.grain_outlined),
          BarItem(filledIcon: Icons.speed, outlinedIcon: Icons.speed_outlined),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: buildBody,
      ),
    );
  }
}
