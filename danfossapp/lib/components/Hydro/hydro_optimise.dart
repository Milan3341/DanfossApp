import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

import '../../widgets/custom_text_for_table.dart';
import '../../widgets/custom_vertical_slider.dart';

class HydroOptimise extends StatefulWidget {
  const HydroOptimise({super.key});

  @override
  State<HydroOptimise> createState() => _HydroOptimiseState();
}

class _HydroOptimiseState extends State<HydroOptimise> {
  double byPassvalve = 0;
  double chillerLoadpercentage = 0;
  double pumps = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Optimise'),
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
                            max: 100,
                            min: -100,
                            onchanged: (value) {
                              setState(() {
                                byPassvalve = value;
                              });
                            },
                            value: byPassvalve),
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
                            min: -100,
                            onchanged: (value) {
                              setState(() {
                                byPassvalve = value;
                              });
                            },
                            value: byPassvalve),
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
                                min: -100,
                                onchanged: (value) {
                                  setState(() {
                                    byPassvalve = value;
                                  });
                                },
                                value: byPassvalve),
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
                                min: -100,
                                onchanged: (value) {
                                  setState(() {
                                    byPassvalve = value;
                                  });
                                },
                                value: byPassvalve),
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
