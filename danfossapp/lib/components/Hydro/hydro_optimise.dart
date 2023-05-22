import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

import '../../widgets/custom_text_for_table.dart';
import '../../widgets/custom_vertical_slider.dart';

class HydroOptimise extends StatelessWidget {
  final dynamic slider7_1;
  final dynamic slider7_3;
  final dynamic slider6_1;
  final dynamic slider6;
  final bool hydroMetricBool;
  final Function onChangeSlider;
  final dynamic label49_5;
  final dynamic label49_7;
  final dynamic label50_1;
  final dynamic label44_8;
  final dynamic label86;
  final dynamic label100;
  final dynamic label99;
  final dynamic label49_9;
  final dynamic label96;
  final dynamic label49_10;
  final dynamic label50_2;
  final dynamic label87;
  final dynamic label1;
  final dynamic label59;
  final dynamic label63;

  const HydroOptimise(
      {super.key,
      required this.label1,
      required this.label100,
      required this.label44_8,
      required this.label49_10,
      required this.label49_5,
      required this.label49_7,
      required this.label49_9,
      required this.label50_1,
      required this.label50_2,
      required this.label59,
      required this.label63,
      required this.label86,
      required this.label87,
      required this.label96,
      required this.label99,
      required this.slider6,
      required this.slider6_1,
      required this.slider7_1,
      required this.slider7_3,
      required this.hydroMetricBool,
      required this.onChangeSlider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Optimise'),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 60),
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Per  Year \n ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      CustomTextForTable(text: 'Plant Opex'),
                      CustomTextForTable(text: 'Chiller Opex '),
                      CustomTextForTable(text: 'CHWP Opex '),
                      CustomTextForTable(text: 'CWP Opex '),
                      CustomTextForTable(text: 'Fan Opex ')
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Conventional \n Setup',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const CustomTextForTable(text: '\$ 10000000'),
                      const CustomTextForTable(text: '\$ 10000000'),
                      const CustomTextForTable(text: '\$ 10000000'),
                      const CustomTextForTable(text: '\$ 10000000'),
                      const CustomTextForTable(text: '\$ 10000000'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'DANFOSS PIBC \n Setup',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const CustomTextForTable(text: '\$ 10000000'),
                      const CustomTextForTable(text: '\$ 10000000'),
                      const CustomTextForTable(text: '\$ 10000000'),
                      const CustomTextForTable(text: '\$ 10000000'),
                      const CustomTextForTable(text: '\$ 10000000'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Saving Per Year',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Text(
                  '\$ ${10000}',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                      'See Valve with image',
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
                            bottom: 100,
                            left: 40,
                            child: Text(
                              '12 c ECHW',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          Positioned(
                            bottom: 45,
                            left: 50,
                            child: Text(
                              '7 c Delta T',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 80,
                            child: Text(
                              '5 c LCHW',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Bypass \n Valve',
                            style: Theme.of(context).textTheme.displaySmall),
                        CustomVerticalSlider(
                            max: 102,
                            min: 100,
                            onchanged: (value) {
                              onChangeSlider(value, 73);
                            },
                            value: slider7_3),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Open',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(
                          height: 88,
                        ),
                        Text(
                          'Closed',
                          style: Theme.of(context).textTheme.displaySmall,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Chiller \n Load %',
                            style: Theme.of(context).textTheme.displaySmall),
                        CustomVerticalSlider(
                            max: 100,
                            min: 80,
                            onchanged: (value) {
                              onChangeSlider(value, 71);
                            },
                            value: slider7_1),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '100%',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Text(
                          '50%',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Pumps',
                        style: Theme.of(context).textTheme.displaySmall),
                    Row(
                      children: [
                        Column(
                          children: [
                            CustomVerticalSlider(
                                max: 100,
                                min: 16,
                                onchanged: (value) {
                                  onChangeSlider(value, 61);
                                },
                                value: slider6_1),
                            Text(
                              'CHWP',
                              style: Theme.of(context).textTheme.displaySmall,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Max \nRPM',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Text(
                              'Min \nRPM',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomVerticalSlider(
                                max: 100,
                                min: 16,
                                onchanged: (value) {
                                  onChangeSlider(value, 6);
                                },
                                value: slider6),
                            Text(
                              'CWP',
                              style: Theme.of(context).textTheme.displaySmall,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
