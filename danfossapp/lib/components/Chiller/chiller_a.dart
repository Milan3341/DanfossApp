import 'package:danfossapp/bloc/Data.dart';
import 'package:danfossapp/models/chiller_model.dart';
import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:danfossapp/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_checkbox.dart';
import '../../widgets/custom_slider.dart';
import '../../widgets/custom_text_box.dart';
import '../../widgets/slider_label.dart';

class ChillerA extends StatelessWidget {
  final ChillerData? selectedData;
  final Function onchangeSlider;
  final Function onChangeChillerAoilDeg;
  final Function onChangeSelectedData;
  final bool chillerEffAdjbool;
  final bool chillerMetricBool;
  final bool chillerImperialBool;
  final double slider4;
  final bool chillerAoilDegradationBool;
  final double slider5;
  final double slider3;
  final double slider2;
  final dynamic label14;
  final dynamic label12;
  final dynamic label14_1;
  final dynamic label15_1;
  final dynamic label15;
  final dynamic label14_2;
  final dynamic label17_1;
  final dynamic label17_2;
  final dynamic label17;
  final dynamic label26;
  final dynamic label32;
  final dynamic label38;
  final dynamic label10;

  ChillerA(
      {super.key,
      required this.label12,
      required this.label10,
      required this.label14_2,
      required this.label14,
      required this.label14_1,
      required this.label15,
      required this.label15_1,
      required this.label17,
      required this.label17_1,
      required this.label17_2,
      required this.label38,
      required this.label26,
      required this.label32,
      required this.onChangeSelectedData,
      required this.onChangeChillerAoilDeg,
      required this.onchangeSlider,
      required this.chillerAoilDegradationBool,
      required this.slider2,
      required this.slider3,
      required this.slider4,
      required this.slider5,
      required this.selectedData,
      required this.chillerEffAdjbool,
      required this.chillerImperialBool,
      required this.chillerMetricBool});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Chiller A'),
      body: BlocBuilder<DataBloc, List<ChillerData>>(
        builder: (context, chillerData) {
          if (chillerData == null || chillerData.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 60),
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
                          items: chillerData
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
                          items: chillerData
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
                        items: chillerData
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
                        items: chillerData
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
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: CustomSlliderLabel(
                          display: chillerEffAdjbool,
                          value: slider4,
                          label: 'Capacity Adj')),
                  SizedBox(
                      child: chillerEffAdjbool
                          ? CustomSlider(
                              value: slider4,
                              min: -500,
                              max: 500,
                              onchanged: (dynamic value) {
                                onchangeSlider(value, 4);
                              })
                          : null),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: chillerMetricBool
                          ? CustomTextBox(
                              text1: 'Chiller A Kwr',
                              text2: 'IPLV KW/KWR',
                              text3: 'Full Load')
                          : null),
                  SizedBox(
                      child: chillerMetricBool
                          ? CustomTextBox(
                              text1: '$label14',
                              text2: '$label14_1',
                              text3: '$label14_2')
                          : null),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: chillerImperialBool
                          ? CustomTextBox(
                              textDirection: TextDirection.rtl,
                              text1: 'Full load',
                              text2: 'IPLV KW/TR',
                              text3: 'Chiller A TR')
                          : null),
                  SizedBox(
                      child: chillerImperialBool
                          ? CustomTextBox(
                              text1: '$label12',
                              text2: '$label15',
                              text3: '$label15_1')
                          : null),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                    child: chillerEffAdjbool
                        ? CustomSlliderLabel(value: slider5, label: 'Eff Adj')
                        : null,
                  ),
                  SizedBox(
                    child: chillerEffAdjbool
                        ? CustomSlider(
                            max: 500,
                            min: -500,
                            onchanged: (value) {
                              onchangeSlider(value, 5);
                            },
                            value: slider5)
                        : null,
                  ),
                  CustomSlider(
                      max: 100,
                      min: -200,
                      enableTooltip: true,
                      onchanged: (value) {
                        onchangeSlider(value, 3);
                      },
                      value: slider3),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CustomTextBox(
                          text1: '$label17_1',
                          text2: '$label17_2',
                          text3: '$label17')),
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
                              onChangeChillerAoilDeg(value);
                            },
                            value: chillerAoilDegradationBool,
                            label: '        Oil \nDegradation',
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.7,
                          height: 90,
                          child: chillerAoilDegradationBool
                              ? Column(
                                  children: [
                                    CustomSlider(
                                      max: 20,
                                      min: 0,
                                      onchanged: (value) {
                                        onchangeSlider(value, 2);
                                      },
                                      value: slider2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '$label26 Percentage',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            ' $label32 Year',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(color: Colors.black),
                                          ),
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
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '\$ $label38',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '\$ $label10',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
