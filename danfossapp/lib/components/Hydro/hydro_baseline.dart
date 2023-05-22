import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:danfossapp/widgets/custom_slider.dart';
import 'package:danfossapp/widgets/custom_vertical_slider.dart';
import 'package:danfossapp/widgets/slider_label.dart';
import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class HydroBaseline extends StatelessWidget {
  final Function onChangeSlider;
  final dynamic slider6_14;
  final dynamic slider6_15;
  final dynamic slider6_16;
  final dynamic slider6_17;
  final dynamic slider6_20;
  final dynamic slider6_21;
  final dynamic slider6_18;
  final dynamic slider6_19;
  final dynamic label61_3;
  final dynamic label48_54;
  final dynamic label48_34;
  final dynamic label102;
  final dynamic label48_55;
  final dynamic label106;
  final dynamic label53_1;
  final dynamic label48_57;
  final dynamic label48_58;
  final dynamic label108;
  final dynamic label63_1;
  final dynamic label102_1;
  final dynamic label86;
  final dynamic label100;
  final dynamic label99;

  final bool hydroMetricBool;

  const HydroBaseline({
    super.key,
    required this.label100,
    required this.label102,
    required this.label102_1,
    required this.label106,
    required this.label108,
    required this.label48_34,
    required this.label48_54,
    required this.label48_55,
    required this.label48_57,
    required this.label48_58,
    required this.label53_1,
    required this.label61_3,
    required this.label63_1,
    required this.label86,
    required this.label99,
    required this.slider6_21,
    required this.slider6_20,
    required this.slider6_19,
    required this.slider6_18,
    required this.onChangeSlider,
    required this.hydroMetricBool,
    required this.slider6_14,
    required this.slider6_15,
    required this.slider6_16,
    required this.slider6_17,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic labelPerKWhydro = slider6_16 / 100;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Baseline'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 60),
        child: Column(
          children: [
            CustomSlliderLabel(
              displayLabel2: false,
              value: slider6_14,
              label: 'Capacity',
            ),
            CustomSlider(
                max: 1000,
                min: 100,
                onchanged: (dynamic newvalue) {
                  onChangeSlider(newvalue, 614);
                },
                value: slider6_14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    'Ton ${slider6_14.toStringAsFixed(0)}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                Visibility(
                  visible: hydroMetricBool,
                  child: Expanded(
                    child: Text(
                      'Kwr $label48_34',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                )
              ],
            ),
            CustomSlliderLabel(
              value: slider6_15,
              label: 'Chiller COP',
              displayLabel2: false,
            ),
            CustomSlider(
                max: 99,
                min: 25,
                onchanged: (dynamic newvalue) {
                  onChangeSlider(newvalue, 615);
                },
                value: slider6_15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    'Tr /Kw ${(slider6_15 / 100).toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
                Visibility(
                  visible: hydroMetricBool,
                  child: Expanded(
                    child: Text(
                      'Kwr ${label61_3}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                )
              ],
            ),
            CustomSlliderLabel(
                value: labelPerKWhydro, numroundedlider: 2, label: '\$ Per Kw'),
            CustomSlider(
                max: 30,
                min: 1,
                onchanged: (dynamic value) {
                  onChangeSlider(value, 616);
                },
                value: slider6_16),
            CustomSlliderLabel(value: slider6_17, label: 'Run Hours Per Year'),
            CustomSlider(
                interval: 1000,
                max: 8760,
                min: 0,
                onchanged: (dynamic value) {
                  onChangeSlider(value, 617);
                },
                value: slider6_17),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Card(
                color: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: RoundedExpansionTile(
                    leading: Icon(
                      Icons.photo,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    title: Text(
                      'See Flow with image',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white),
                    ),
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.red,
                            child: Image.asset(
                              'assets/images/Plant1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 35,
                            left: 80,
                            child: Text(
                              'KW/RT \n ${label106}',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 110,
                            child: Text(
                              'KPA \n $label53_1',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 80,
                            child: Text(
                              'KPA \n $label63_1',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          Positioned(
                            right: 80,
                            top: 15,
                            child: Text(
                              'KW/RT \n $label108',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'CHWP',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Text(
                                    'Flow L/S  $label48_54',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  CustomVerticalSlider(
                                      max: 30,
                                      min: -20,
                                      onchanged: (dynamic value) {
                                        onChangeSlider(value, 620);
                                      },
                                      value: slider6_20),
                                  Text(
                                    'Flow\nUSGPM',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${label102}',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '${label48_55.toStringAsFixed(1)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  CustomVerticalSlider(
                                      max: 30,
                                      min: -20,
                                      onchanged: (dynamic value) {
                                        onChangeSlider(value, 621);
                                      },
                                      value: slider6_21),
                                  Text(
                                    'Head \nMts',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'CWP',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Row(
                          children: [
                            Text(
                              '1506',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Flow L/S   125',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  CustomVerticalSlider(
                                      max: 30,
                                      min: -20,
                                      onchanged: (dynamic value) {
                                        onChangeSlider(value, 618);
                                      },
                                      value: slider6_18),
                                  Text(
                                    'Flow \n USGPM',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '17.3',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                CustomVerticalSlider(
                                    max: 30,
                                    min: -20,
                                    onchanged: (dynamic value) {
                                      onChangeSlider(value, 619);
                                    },
                                    value: slider6_19),
                                Text(
                                  'Head \n Mts',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Plant Opex Per Year',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      '\$ ${10000000}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Plant COP',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Text(
                        ' ${0.68}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Text(
                        ' ${5.16}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
