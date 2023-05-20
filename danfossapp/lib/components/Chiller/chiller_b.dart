import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:danfossapp/widgets/slider_label.dart';
import 'package:flutter/material.dart';
import '../../models/chiller_model.dart';
import '../../widgets/custom_checkbox.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_slider.dart';
import '../../widgets/custom_text_box.dart';

class ChillerB extends StatelessWidget {
  final ChillerData? selectedData;
  final bool chillerEffAdjbool;
  final bool chillerMetricBool;
  final bool chillerImperialBool;
  final Function onchangeSlider;
  final Function onChangeChillerBoilDeg;
  final Function onChangeSelectedData;
  final double slider4_3;
  final bool chillerBoilDegradationBool;
  final double slider3_4;
  final double slider5_4;
  final double slider2_3;
  final dynamic label38_7;
  final dynamic label10_8;
  final dynamic label32_4;
  final dynamic label26_3;
  final dynamic label17_13;
  final dynamic label17_12;
  final dynamic label17_14;
  final dynamic label15_9;
  final dynamic label14_25;
  final dynamic label15_8;
  final dynamic label14_24;
  final dynamic label12_5;
  final dynamic label14_23;
  ChillerB(
      {super.key,
      required this.label10_8,
      required this.label12_5,
      required this.label14_24,
      required this.label14_25,
      required this.label15_8,
      required this.label15_9,
      required this.label17_12,
      required this.label17_13,
      required this.label17_14,
      required this.label26_3,
      required this.label32_4,
      required this.label14_23,
      required this.label38_7,
      required this.onChangeChillerBoilDeg,
      required this.chillerBoilDegradationBool,
      required this.onChangeSelectedData,
      required this.onchangeSlider,
      required this.slider2_3,
      required this.slider5_4,
      required this.slider4_3,
      required this.slider3_4,
      required this.selectedData,
      required this.chillerEffAdjbool,
      required this.chillerImperialBool,
      required this.chillerMetricBool});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Chiller B'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 6, left: 6, right: 6, bottom: 60),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                    CustomDropDown(
                      selectedData: selectedData,
                      onChanged: (Object? newValue) {
                        onChangeSelectedData(newValue);
                      },
                      items: ChillerData.chillerdatalist
                          .map((ChillerData? newValue) => DropdownMenuItem(
                                value: newValue,
                                child: Text(
                                  newValue!.Column2,
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomDropDown(
                    selectedData: selectedData,
                    onChanged: (Object? newValue) {
                      onChangeSelectedData(newValue);
                    },
                    items: ChillerData.chillerdatalist
                        .map((ChillerData? newValue) => DropdownMenuItem(
                              value: newValue,
                              child: Text(
                                newValue!.PowerAppsId,
                              ),
                            ))
                        .toList(),
                  ),
                  CustomDropDown(
                    selectedData: selectedData,
                    onChanged: null,
                    items: ChillerData.chillerdatalist
                        .map((ChillerData? newValue) => DropdownMenuItem(
                              value: newValue,
                              child: Text(
                                newValue!.Column4,
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: CustomSlliderLabel(
                      display: chillerEffAdjbool,
                      value: slider4_3,
                      label: 'Capacity Adj')),
              SizedBox(
                  child: chillerEffAdjbool
                      ? CustomSlider(
                          value: slider4_3,
                          min: -500,
                          max: 500,
                          onchanged: (dynamic value) {
                            onchangeSlider(value, 43);
                          })
                      : null),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: chillerMetricBool
                      ? CustomTextBox(
                          text1: 'Chiller B Kwr',
                          text2: 'IPLV KW/KWR',
                          text3: 'Full Load')
                      : null),
              SizedBox(
                  child: chillerMetricBool
                      ? CustomTextBox(
                          text1: '$label14_23',
                          text2: '$label14_24',
                          text3: '$label14_25')
                      : null),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: chillerImperialBool
                      ? CustomTextBox(
                          textDirection: TextDirection.rtl,
                          text1: 'Full load',
                          text2: 'IPLV KW/TR',
                          text3: 'Chiller B TR')
                      : null),
              SizedBox(
                  child: chillerImperialBool
                      ? CustomTextBox(
                          text1: '$label12_5',
                          text2: '$label15_8',
                          text3: '$label15_9')
                      : null),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                child: chillerEffAdjbool
                    ? CustomSlliderLabel(value: slider5_4, label: 'Eff Adj')
                    : null,
              ),
              SizedBox(
                child: chillerEffAdjbool
                    ? CustomSlider(
                        max: 500,
                        min: -500,
                        onchanged: (value) {
                          onchangeSlider(value, 54);
                        },
                        value: slider5_4)
                    : null,
              ),
              CustomSlider(
                  max: 100,
                  min: -200,
                  enableTooltip: true,
                  onchanged: (dynamic value) {
                    onchangeSlider(value, 34);
                  },
                  value: slider3_4),
              Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomTextBox(
                      text1: '$label17_12',
                      text2: '$label17_13',
                      text3: '$label17_14')),
              Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CustomTextBox(
                      text1: '\$ Per/Kwr',
                      text2: '\$ Per/Ton',
                      text3: '\$ Chiller')),
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 23),
                child: Row(
                  children: [
                    Container(
                      color: Theme.of(context).colorScheme.primary,
                      child: CustomCheckBox(
                        ontap: (value) {
                          onChangeChillerBoilDeg(value);
                        },
                        value: chillerBoilDegradationBool,
                        label: '        Oil \nDegradation',
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.7,
                      height: 90,
                      child: chillerBoilDegradationBool
                          ? Column(
                              children: [
                                CustomSlider(
                                  max: 20,
                                  min: 0,
                                  onchanged: (dynamic value) {
                                    onchangeSlider(value, 23);
                                  },
                                  value: slider2_3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '$label26_3 Percentage',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                    Text(
                                      ' $label32_4 Year',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : null,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Opex with Oil Degradation',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '\$ $label38_7',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Opex Per Annum',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '\$ $label10_8',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
