import 'dart:math';

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
    final label44_9 = slider6_14;
    final label80_1 = slider7_1 / 100;
    final label44_14 = slider6_15 / 100;
    final label82 = double.parse((label44_14 * label80_1).toStringAsFixed(2));
    //Hydronic Plant Baseline
    //Kwr
    final label48_34 = (label44_9 * 3.5).round();

    //chiller Cop Kwr
    final label61_3 = double.parse((12 / (label82 * 3.412)).toStringAsFixed(2));

    const label85 = 0.042205;
//chwp top
    final label48_54 = ((label48_34 * label85).round() + slider6_20).round();
    //Chwp side
    final label102 = (label48_54 * 15.850).round();
    //Chwp left slider
    final label48_55 =
        double.parse((label48_34 / 100 + 4).toStringAsFixed(1)) + slider6_21;

    final label48_38 = (label48_54 * 1000 * 9.81 * label48_55) /
        (pow(10, 6) * (90 / 100) * (79.5 / 100));
    final label44_15 = slider6_17;
    final label48_45 = label48_38 * (label44_15 * .1);
    final label48_36 = label48_54 * 80 / 100;

    final label48_44 = pow((label48_36 / label48_54), 2) * label48_55;

    final label48_47 = (label48_36 * 1000 * 9.81 * label48_44) /
        (pow(10, 6) * (68 / 100) * (59 / 100));

    final label48_50 = label48_47 * (label44_15 * .6);

    final label48_35 = label48_54 * 90 / 100;
    final label48_40 = pow((label48_36 / label48_35), 2) * label48_55;
    final label48_42 = (label48_35 * 1000 * 9.81 * label48_40) /
        (pow(10, 6) * (80 / 100) * (69 / 100));
    final label48_48 = label48_42 * (label44_15 * .3);
    final label48_29 = (label48_45 + label48_50 + label48_48).round();
    final label60 = slider6_1 / 100;
    //Left Kwrt
    final label106 = double.parse(
        (label48_29 / label44_15 / label44_9 * label60).toStringAsFixed(2));

//left kpa
    final label53_1 = (label48_55 * .102).round();

//top cwp left slider
    final label48_57 = ((label48_34 * .054).round() + slider6_18).round();

    //cwp right slider value
    final label48_58 = label48_55 * .8 + slider6_19;

    final label48_51 = (label48_57 * 1000 * 9.81 * label48_58) /
        (pow(10, 6) * (90 / 100) * (80 / 100));
    final label48_37 = label48_51 * (label44_15 * .2);

    final label48_41 = label48_57 * 90 / 100;
    final label48_49 = pow((label48_41 / label48_57), 2) * label48_58;
    final label48_53 = (label48_41 * 1000 * 9.8 * label48_49) /
        (pow(10, 6) * (80 / 100) * (69 / 100));

    final label48_39 = label48_53 * (label44_15 * .4);

    final label48_46 = label48_57 * 80 / 100;
    final label48_52 = pow((label48_46 / label48_57), 2) * label48_58;
    final label48_56 = (label48_46 * 1000 * 9.81 * label48_52) /
        (pow(10, 6) * (68 / 100) * (59 / 100));
    final label48_43 = label48_56 * (label44_15 * .4);
    final label48_32 = (label48_37 + label48_39 + label48_43).round();

    final label60_1 = slider6 / 100;
    //right kwrt
    final label108 = double.parse(
        (label48_32 / label44_15 / label44_9 * label60_1).toStringAsFixed(3));

//right kpa
    final label63_1 = (label48_58 * .102).round();

    //right cwp left value
    final label102_1 = (label48_57 * 15.850).round();

    final label44_13 = slider6_16 / 100;
//CHWP Opex Per Year
    final label49_5 = (label48_29 * label44_13).round();
    //CWP Opex per year
    final label49_7 = (label48_32 * label44_13).round();

    //Fan Opex Per Year
    final label50_1 = (label49_5 * .32).round();
    final label44_16 = slider6_14;
    const slider7_2 = 100;
    const label55 = slider7_2 / 100;
    //Chiller Opex Per Year
    final label44_8 =
        (label44_16 * label44_14 * label44_15 * label44_13 * label55).round();
    //plant opex Per year
    final label86_1 = label49_5 + label49_7 + label50_1 + label44_8;
    final label86 = label49_5 + label49_7 + label50_1 + label44_8;

    final label50 = label44_9 * label82;
    final label51 = label44_9 * label106;
    final label61 = label44_9 * label108;
    final label76 = (label50 + label51 + label61) / label44_9;
    //Plant Cop First Value
    final label100 = double.parse(label76.toStringAsFixed(2));
    //Plant Cop Second Value
    final label99 = double.parse(((12 / label76) / 3.412).toStringAsFixed(2));
    final label56 = slider7_3 / 100;

    final label44_17 = (label44_16 *
            label44_14 *
            label44_15 *
            label44_13 *
            label80_1 *
            label55 *
            label56)
        .round();

    final label48_30 = (label48_45 + label48_50 + label48_48).round();
    //need to know
    final label92 = label48_30;
    final label54_1 = slider6_1 / 100;
    //Chwp per Year
    final label49_9 = (label92 * label44_13 * label54_1).round();

    final label48_59 = (label48_37 + label48_39 + label48_43);

    //need to know
    final label96 = label48_59;

    final label54 = slider6 / 100;
    //CWP Opex per year
    final label49_10 = (label96 * label44_13 * label54).round();

    // Fan Opx Per year
    final label50_2 = (label49_9 * .32).round();

//Hydronic Plant Optimise Danfoss PIBC setup
    final label87 = label44_17 + label49_9 + label49_10 + label50_2;

    //saving per year
    final label1 = label86 - label87;
    final label62 = slider7_3 - 107;
    //ECHW
    final label59 = (label62 * -1 + 5).round();
//Delta
    final label63 = (label62 * -1).round();

    buildBody = [
      HydroBaseline(
        label100: label100,
        label102: label102,
        label102_1: label102_1,
        label106: label106,
        label108: label108,
        label48_34: label48_34,
        label48_54: label48_54,
        label48_55: label48_55,
        label48_57: label48_57,
        label48_58: label48_58,
        label53_1: label53_1,
        label61_3: label61_3,
        label63_1: label63_1,
        label86: label86,
        label99: label99,
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
      HydroOptimise(
        label44_17: label44_17,
        label100: label100,
        label1: label1,
        label44_8: label44_8,
        label49_10: label49_10,
        label49_5: label49_5,
        label49_7: label49_7,
        label49_9: label49_9,
        label50_1: label50_1,
        label50_2: label50_2,
        label59: label59,
        label63: label63,
        label86: label86,
        label87: label87,
        label96: label96,
        label99: label99,
        slider6: slider6,
        slider6_1: slider6_1,
        slider7_1: slider7_1,
        slider7_3: slider7_3,
        onChangeSlider: _onChangeSlider,
        hydroMetricBool: hydroMetricBool,
      )
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
