import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:danfossapp/widgets/custom_dropdown.dart';
import 'package:danfossapp/widgets/custom_slider.dart';

import 'package:danfossapp/widgets/custom_text_for_table.dart';
import 'package:danfossapp/widgets/slider_label.dart';
import 'package:flutter/material.dart';

import '../../models/chiller_model.dart';
import '../../widgets/custom_checkbox.dart';

class ChillerResult extends StatelessWidget {
  final ChillerData? selectedData;
  final ChillerData? selectedData2;
  final Function onChangeSelectedData;
  final Function onChangeSelectedData2;
  final double slider1_4;
  final double slider1_5;
  final bool calulatewithOilDeg;
  final Function ontapCalulateWithOilDeg;
  final Function onChangeSlider;
  final dynamic label38_6;
  final dynamic label38_9;
  final dynamic label12_4;
  final dynamic label14_20;
  final dynamic label12_6;
  final dynamic label14_26;
  final dynamic label39;
  final dynamic label39_2;
  final dynamic label10_9;
  final dynamic label10_11;
  final dynamic label20_5;
  final dynamic label20_6;
  final dynamic label16;
  final dynamic label20;
  final dynamic label16_1;
  final dynamic label20_1;
  final dynamic label7;
  final dynamic label23;
  final dynamic label33_2;
  const ChillerResult(
      {super.key,
      required this.label10_11,
      required this.label10_9,
      required this.label12_4,
      required this.label12_6,
      required this.label14_20,
      required this.label14_26,
      required this.label16,
      required this.label16_1,
      required this.label20,
      required this.label20_1,
      required this.label20_5,
      required this.label20_6,
      required this.label23,
      required this.label33_2,
      required this.label38_6,
      required this.label38_9,
      required this.label39,
      required this.label39_2,
      required this.label7,
      required this.onChangeSelectedData,
      required this.onChangeSelectedData2,
      required this.selectedData2,
      required this.onChangeSlider,
      required this.selectedData,
      required this.slider1_4,
      required this.slider1_5,
      required this.calulatewithOilDeg,
      required this.ontapCalulateWithOilDeg});

  @override
  Widget build(BuildContext context) {
    final labelperkw = slider1_5 / 100;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Chiller Result'),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 60),
        child: Column(
          children: [
            CustomSlliderLabel(value: slider1_4, label: 'Operating Hours'),
            CustomSlider(
                max: 8760,
                min: 0,
                onchanged: (dynamic value) {
                  onChangeSlider(value, 14);
                },
                value: slider1_4),
            CustomSlliderLabel(
                value: labelperkw, numroundedlider: 2, label: '\$ Per KW/Hr'),
            CustomSlider(
                max: 35,
                min: 0,
                onchanged: (dynamic value) {
                  onChangeSlider(value, 15);
                },
                value: slider1_5),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 1.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chiller A TR     \$ $label12_4',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Chiller A KWR \$ $label14_20',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomDropDown(
                        selectedData: selectedData,
                        onChanged: (Object? newValue) {
                          onChangeSelectedData(newValue);
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chiller B TR     \$ $label12_6',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Chiller B KWR \$ $label14_26',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomDropDown(
                        selectedData: selectedData2,
                        onChanged: (Object? newValue) {
                          onChangeSelectedData2(newValue);
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
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(children: [
                Container(
                  color: Theme.of(context).colorScheme.primary,
                  child: CustomCheckBox(
                    ontap: (value) {
                      ontapCalulateWithOilDeg(value);
                    },
                    value: calulatewithOilDeg,
                    label: 'Calculate with Oil Degradation',
                  ),
                ),
              ]),
            ),
            Container(
              color: Theme.of(context).colorScheme.outlineVariant,
              height: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(''),
                        Visibility(
                            visible: calulatewithOilDeg,
                            child: const CustomTextForTable(
                                text: 'Opex (w/ Oil Degr.)')),
                        const CustomTextForTable(text: 'Chilller Capex'),
                        const CustomTextForTable(text: 'Opex Per Annum'),
                        const CustomTextForTable(text: 'Ownership (10 years)'),
                        const CustomTextForTable(text: 'CO2 Emissions Tons'),
                        const CustomTextForTable(text: 'Kw/hr'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Chiller A',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                        Visibility(
                            visible: calulatewithOilDeg,
                            child: CustomTextForTable(text: '\$ $label38_6')),
                        CustomTextForTable(text: '\$ $label39'),
                        CustomTextForTable(text: '\$ $label10_11'),
                        CustomTextForTable(text: '\$ $label20_5'),
                        CustomTextForTable(text: '\$ $label16_1'),
                        CustomTextForTable(text: '\$ $label16'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Chiller B',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                        Visibility(
                            visible: calulatewithOilDeg,
                            child: CustomTextForTable(text: '\$ $label38_9')),
                        CustomTextForTable(text: '\$ $label12_6'),
                        CustomTextForTable(text: '\$ $label10_9'),
                        CustomTextForTable(text: '\$ $label20_6'),
                        CustomTextForTable(text: '\$ $label20_1'),
                        CustomTextForTable(text: '\$ $label20'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Saving Per Year',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                      Text(
                        'Return on Investment',
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          '\$ $label7',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                      Text(
                        '$label33_2 years',
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
