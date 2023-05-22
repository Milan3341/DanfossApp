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
  double slider6_14 = 500;
  double slider6_15 = 60;
  double slider6_16 = 14;
  double slider6_17 = 5000;
  double slider6_20 = 0;
  double slider6_21 = 0;
  double slider6_18 = 0;
  double slider6_19 = 0;
  double slider7_3 = 100;
  double slider7_1 = 100;
  double slider6_1 = 100;
  double slider6 = 100;

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

  void _onChangeSlider(dynamic value, int slidername) {
    setState(() {
      if (slidername == 614) {
        slider6_14 = value;
      } else if (slidername == 615) {
        slider6_15 = value;
      } else if (slidername == 616) {
        slider6_16 = value;
      } else if (slidername == 617) {
        slider6_17 = value;
      } else if (slidername == 620) {
        slider6_20 = value;
      } else if (slidername == 621) {
        slider6_21 = value;
      } else if (slidername == 618) {
        slider6_18 = value;
      } else if (slidername == 619) {
        slider6_19 = value;
      } else if (slidername == 73) {
        slider7_3 = value;
      } else if (slidername == 71) {
        slider7_1 = value;
      } else if (slidername == 61) {
        slider6_1 = value;
      } else if (slidername == 6) {
        slider6 = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    buildBody = [
      HydroBaseline(
        slider6_18: slider6_18,
        slider6_19: slider6_19,
        slider6_20: slider6_20,
        slider6_21: slider6_21,
        slider6_14: slider6_14,
        slider6_15: slider6_15,
        slider6_16: slider6_16,
        slider6_17: slider6_17,
        hydroMetricBool: hydroMetricBool,
        onChangeSlider: _onChangeSlider,
      ),
      HydroOptimise()
    ];
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
