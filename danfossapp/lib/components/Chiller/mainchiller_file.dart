import 'package:danfossapp/bloc/Data.dart';
import 'package:danfossapp/components/Chiller/chiller_A.dart';
import 'package:danfossapp/components/Chiller/result.dart';
import 'package:danfossapp/widgets/custom_bottomnavbar.dart';
import 'package:danfossapp/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import '../../models/chiller_model.dart';
import '../../widgets/custom_checkbox.dart';
import '../../widgets/custom_dropdown.dart';
import 'chiller_b.dart';

class Chiller extends StatefulWidget {
  const Chiller({super.key});

  @override
  State<Chiller> createState() => _ChillerState();
}

class _ChillerState extends State<Chiller> {
  ChillerData selectedData = ChillerData.chillerdatalist[0];
  ChillerData selectedData2 = ChillerData.chillerdatalist[0];

  int selectedIndex = 0;
  bool chillerEffAdjbool = true;
  bool chillerMetricBool = true;
  bool chillerImperialBool = true;
  bool calulatewithOilDeg = false;
  List<Widget> buildBody = [];
  double slider4 = 0;
  bool imperial = false;
  bool chillerAoilDegradationBool = false;
  double slider5 = 0;
  double slider3 = 0;
  double slider2 = 0;
  double slider4_3 = 0;
  bool chillerBoilDegradationBool = false;
  double slider5_4 = 0;
  double slider3_4 = 0;
  double slider2_3 = 0;
  double slider1_4 = 5000;
  double slider1_5 = 14;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _ontapMetric(bool? value) {
    setState(() {
      chillerMetricBool = value!;
    });
  }

  void _ontapAdj(bool? value) {
    setState(() {
      chillerEffAdjbool = value!;
    });
  }

  void _ontapImperial(bool? value) {
    setState(() {
      chillerImperialBool = value!;
    });
  }

  void _ontapChillerAoilDeg(bool? value) {
    setState(() {
      chillerAoilDegradationBool = value!;
    });
  }

  void _ontapChillerBoilDeg(bool? value) {
    setState(() {
      chillerBoilDegradationBool = value!;
    });
  }

  void _ontapCalculatewithOilDeg(bool? value) {
    setState(() {
      calulatewithOilDeg = value!;
    });
  }

  void _selectedDatachiller1(Object? newvalue) {
    setState(() {
      selectedData = newvalue! as ChillerData;
    });
  }

  void _selectedDatachiller2(Object? newvalue) {
    setState(() {
      selectedData2 = newvalue! as ChillerData;
    });
  }

  void _onChangeSlider(dynamic value, int slidername) {
    setState(() {
      if (slidername == 3) {
        slider3 = value;
      } else if (slidername == 2) {
        slider2 = value;
      } else if (slidername == 4) {
        slider4 = value;
      } else if (slidername == 5) {
        slider5 = value;
      } else if (slidername == 23) {
        slider2_3 = value;
      } else if (slidername == 34) {
        slider3_4 = value;
      } else if (slidername == 43) {
        slider4_3 = value;
      } else if (slidername == 54) {
        slider5_4 = value;
      } else if (slidername == 14) {
        slider1_4 = value;
      } else if (slidername == 15) {
        slider1_5 = value;
      }
    });
  }

  void _handleCurrencyPressed() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        elevation: 5,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(40),
                ),
                height: MediaQuery.of(context).size.height / 1.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Take me Back')),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Select a Currency',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDropDown(
                        selectedData: selectedData,
                        onChanged: (Object? newValue) {
                          setState(() {
                            selectedData = newValue! as ChillerData;
                          });
                        },
                        items: ChillerData.chillerdatalist
                            .map((ChillerData? newValue) => DropdownMenuItem(
                                  value: newValue,
                                  child: Text(
                                    newValue!.Column1,
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ));
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    const String url =
        'https://djangodanfoss-production.up.railway.app/data/api/powerdata/';

    //Forumla for Chiller A
    final dataBloc = BlocProvider.of<DataBloc>(context);
    dataBloc.fetchData(url);

    final label36 = slider4;

    final label45 = slider5 / 100;
    //chillerA kwr
    final label14 = (selectedData.Column5 + label36).round();
    //chillerATR
    final label12 =
        (selectedData.Column5 * 0.28434 + (label36 / 3.517)).round();
//chillerA Kw/kwr
    final label14_1 =
        double.parse((selectedData.Column7 + label45).toStringAsFixed(2));

    //chillerA IPLV Kw/TR
    final label15 = double.parse((12 / (label14_1 * 3.412)).toStringAsFixed(2));

    //chillerA full Load
    final label14_2 = double.parse((selectedData.Column6).toStringAsFixed(2));

    //chiller A full load2
    final label15_1 =
        double.parse((12 / (selectedData.Column6 * 3.412)).toStringAsFixed(2));

    final label14_6 = selectedData.Column3;
    final label14_7 = selectedData.Column1;
    final label47_4 = label14_6 == "Centrifugal Oil Free" ? 25 : 0;
    final label47_1 = label14_7 == "Air Cooled" ? 450 : 0;
    final label47 = label14_7 == "Water Cooled" ? 300 : 0;
    final label2 = label47_4 + label47_1 + label47;
    final label4 = slider1_5 / 100;
    final label3 = slider1_4;
    final label8 = slider2;
    final label26 = label8.round();
    final label32 = (label8 / 0.8).round();
    final label40 = label8 / 100 + 1;
    // chillerA $ chiller
    final label17 = (label2 * label12 + slider3 * 300).round();

    //ChillerA $per/Kwr
    final label17_1 = (label17 / label14).round();

    //ChillerA per/Ton
    final label17_2 = (label17 / label12).round();
    //ChillerA Opex Per Annum
    final label10 = (label12 * .58 * label15 * label4 * label3).round();

    //ChillerA Opex with Oil Degradation
    final label38 = (label10 * label40).round();

    ///Chiller B
    //chiller B Kwr
    final label36_3 = slider4_3;
    final label14_23 = (selectedData2.Column5 + label36_3).round();
    //chiller B tr
    final label12_5 =
        (selectedData2.Column5 * 0.28434 + (label36_3 / 3.517)).round();
    final label45_3 = slider5_4 / 100;
    //chiller B iplv kw/kwr
    final label14_24 =
        double.parse((selectedData2.Column7 + label45_3).toStringAsFixed(2));
    //chillerB iplv kw/tr
    final label15_8 =
        double.parse((12 / (label14_24 * 3.412)).toStringAsFixed(2));
    //chiller B full load
    final label14_25 = double.parse((selectedData2.Column6).toStringAsFixed(2));
    //chiller B full load 2
    final label15_9 =
        double.parse((12 / (selectedData2.Column6 * 3.412)).toStringAsFixed(2));
    final label14_21 = selectedData2.Column1;
    final label47_20 = label14_21 == "Centrifugal Oil Free" ? 25 : 0;
    final label47_23 = label14_21 == "Air Cooled" ? 450 : 0;
    final label47_22 = label14_21 == "Water Cooled" ? 300 : 0;
    final label2_3 = label47_20 + label47_23 + label47_22;
//chiller b $ chiller
    final label17_14 = (label2_3 * label12_5 + slider3_4 * 300).round();
    //chiller B per/kwr
    final label17_12 = (label17_14 / label14_23).round();
//chiller B Per/ton
    final label17_13 = (label17_14 / label12_5).round();

    //chillerB years
    final label8_3 = slider2_3;
    final label26_3 = label8_3.round();
    final label32_4 = (label8_3 / 0.8).round();
    final label4_4 = slider1_5 / 100;
    final label3_3 = slider1_4;
    final label40_4 = label8_3 / 100 + 1;
    //Chiller B opex Per Annum
    final label10_8 =
        (label12_5 * 0.58 * label15_8 * label4_4 * label3_3).round();

    //chiller B Opex with Oil Deg
    final label38_7 = (label10_8 * label40_4).round();

    //chiller Result
    //opex with oil Deg chiller A
    final label38_6 = (label10 * label40).round();
    //opex with Oil Deg Chiller B
    final label38_9 = (label10_8 * label40_4).round();
    //chillerAtr
    final label12_4 =
        (selectedData.Column5 * 0.28434 + (label36 / 3.417)).round();
    //chillerAkwr
    final label14_20 = (selectedData.Column5 + label36).round();
    //chhiller B TR
    final label12_6 =
        (selectedData2.Column5 * 0.28434 + (label36_3 / 3.417)).round();
    //chillerB KWR
    final label14_26 = (selectedData2.Column5 + label36_3).round();
    //chiller Capax Chiller A
    final label39 = label17;
    //chiller capax chiller B
    final label39_2 = label17_14;
    //chiller A Opex Per Annum
    final label10_9 = label10;
    //chiller B opex per annum
    final label10_11 = label10_8;
    //total cost of Ownership in 10 years chiller a
    final label20_5 = (label10 * 10 + label17).round();
    //total cost of ownership in 10 years chiller B
    final label20_6 = (label10_8 * 10 + label17_14).round();
    //kwhr chiller a
    // final label16 = (label10 / label4).round();
    final label16 = label10 != 0 ? (label10 / label4).round() : 0;

    //kw/hr chiller B
    final label20 = label10_8 != 0 ? (label10_8 / label4).round() : 0;
    //co2 emissions tons chillerA
    final label16_1 = (label16 * 0.000718).round();
    //co2 emissions tons chillerB
    final label20_1 = (label20 * 0.000718).round();
    //savings per year
    final label7 = label38_9 - label38_6;

    final label23 = label17 - label17_14;
    //Return on Investment
    final label33_2 = (label23 / label7).toStringAsFixed(2);

    buildBody = [
      ChillerA(
        label14: label14,
        label14_1: label14_1,
        label14_2: label14_2,
        label15: label15,
        label15_1: label15_1,
        label17: label17,
        label17_1: label17_1,
        label17_2: label17_2,
        label26: label26,
        label32: label32,
        label38: label38,
        label12: label12,
        label10: label10,
        onChangeSelectedData: _selectedDatachiller1,
        onChangeChillerAoilDeg: _ontapChillerAoilDeg,
        onchangeSlider: _onChangeSlider,
        slider2: slider2,
        slider3: slider3,
        slider4: slider4,
        slider5: slider5,
        chillerAoilDegradationBool: chillerAoilDegradationBool,
        selectedData: selectedData,
        chillerEffAdjbool: chillerEffAdjbool,
        chillerImperialBool: chillerImperialBool,
        chillerMetricBool: chillerMetricBool,
      ),
      ChillerB(
        label10_8: label10_8,
        label12_5: label12_5,
        label14_24: label14_24,
        label14_25: label14_25,
        label15_8: label15_8,
        label15_9: label15_9,
        label17_12: label17_12,
        label17_13: label17_13,
        label17_14: label17_14,
        label26_3: label26_3,
        label32_4: label32_4,
        label14_23: label14_23,
        label38_7: label38_7,
        chillerBoilDegradationBool: chillerBoilDegradationBool,
        slider2_3: slider2_3,
        slider3_4: slider3_4,
        slider5_4: slider5_4,
        slider4_3: slider4_3,
        onChangeSelectedData: _selectedDatachiller2,
        onChangeChillerBoilDeg: _ontapChillerBoilDeg,
        onchangeSlider: _onChangeSlider,
        selectedData: selectedData2,
        chillerEffAdjbool: chillerEffAdjbool,
        chillerImperialBool: chillerImperialBool,
        chillerMetricBool: chillerMetricBool,
      ),
      ChillerResult(
        label10_11: label10_11,
        label10_9: label10_9,
        label12_4: label12_4,
        label12_6: label12_6,
        label14_20: label14_20,
        label14_26: label14_26,
        label16: label16,
        label16_1: label16_1,
        label20: label20,
        label20_1: label20_1,
        label20_5: label20_5,
        label20_6: label20_6,
        label23: label23,
        label33_2: label33_2,
        label38_6: label38_6,
        label38_9: label38_9,
        label39: label39,
        label39_2: label39_2,
        label7: label7,
        selectedData2: selectedData2,
        onChangeSelectedData2: _selectedDatachiller2,
        onChangeSelectedData: _selectedDatachiller1,
        selectedData: selectedData,
        onChangeSlider: _onChangeSlider,
        slider1_4: slider1_4,
        slider1_5: slider1_5,
        calulatewithOilDeg: calulatewithOilDeg,
        ontapCalulateWithOilDeg: _ontapCalculatewithOilDeg,
      ),
    ];

    bool isOpened = false;
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: CustomFloatingActionButton(
        children: [
          FloatingActionButton.extended(
              heroTag: null,
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              onPressed: null,
              label: CustomCheckBox(
                  ontap: _ontapAdj, value: chillerEffAdjbool, label: 'Adj')),
          FloatingActionButton.extended(
              heroTag: null,
              onPressed: null,
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              label: CustomCheckBox(
                label: 'Metric',
                ontap: _ontapMetric,
                value: chillerMetricBool,
              )),
          FloatingActionButton.extended(
              heroTag: null,
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              onPressed: null,
              label: CustomCheckBox(
                  ontap: _ontapImperial,
                  value: chillerImperialBool,
                  label: 'Imperial')),
          FloatingActionButton.extended(
              heroTag: null,
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              onPressed: _handleCurrencyPressed,
              label: const Text('Currency')),
        ],
      ),
      bottomNavigationBar: CustomNavBar(baritems: [
        BarItem(filledIcon: const IconData(0x41), outlinedIcon: IconData(0x41)),
        BarItem(
          filledIcon: const IconData(0x0042),
          outlinedIcon: const IconData(0x0042),
        ),
        BarItem(
            filledIcon: Icons.analytics,
            outlinedIcon: Icons.analytics_outlined),
      ], selectedIndex: selectedIndex, ontap: onTap),
      body: IndexedStack(
        index: selectedIndex,
        children: buildBody,
      ),
    );
  }
}
