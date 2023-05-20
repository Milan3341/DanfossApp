import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:danfossapp/widgets/custom_slider.dart';
import 'package:danfossapp/widgets/custom_vertical_slider.dart';
import 'package:danfossapp/widgets/slider_label.dart';
import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class HydroBaseline extends StatefulWidget {
  const HydroBaseline({super.key});

  @override
  State<HydroBaseline> createState() => _HydroBaselineState();
}

class _HydroBaselineState extends State<HydroBaseline> {
  double capacity = 0;
  double chillerCop = 0;
  double perKw = 0;
  double runPerHours = 5000;
  double flow = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Baseline'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 60),
        child: Column(
          children: [
            CustomSlliderLabel(value: capacity, label: 'Capacity'),
            CustomSlider(
                max: 500,
                min: -500,
                onchanged: (dynamic newvalue) {
                  setState(() {
                    capacity = newvalue;
                  });
                },
                value: capacity),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Ton ${capacity.toStringAsFixed(0)}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                Text(
                  'Kwr 5.86',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                )
              ],
            ),
            CustomSlliderLabel(value: chillerCop, label: 'Chiller COP'),
            CustomSlider(
                max: 500,
                min: -500,
                onchanged: (dynamic newvalue) {
                  setState(() {
                    chillerCop = newvalue;
                  });
                },
                value: chillerCop),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Ton ${chillerCop.toStringAsFixed(1)}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                Text(
                  'Kwr ${123}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                )
              ],
            ),
            CustomSlliderLabel(value: perKw, label: '\$ Per Kw'),
            CustomSlider(
                max: 1000,
                min: 0,
                onchanged: (dynamic value) {
                  setState(() {
                    perKw = value;
                  });
                },
                value: perKw),
            CustomSlliderLabel(value: runPerHours, label: 'Run Hours Per Year'),
            CustomSlider(
                interval: 1000,
                max: 5000,
                min: 0,
                onchanged: (dynamic value) {
                  setState(() {
                    runPerHours = value;
                  });
                },
                value: runPerHours),
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
                              'KW/RT \n 0.04',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 110,
                            child: Text(
                              'KPA \n 2',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 80,
                            child: Text(
                              'KPA \n 2',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          Positioned(
                            right: 80,
                            top: 15,
                            child: Text(
                              'KW/RT \n 0.04',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'CHWP',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Flow L/S  125',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            CustomVerticalSlider(
                                max: 100,
                                min: 20,
                                onchanged: (dynamic value) {
                                  setState(() {
                                    flow = value;
                                  });
                                },
                                value: flow),
                            Text(
                              'Flow\nUSGPM',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                        Text(
                          '1173',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Column(
                          children: [
                            Text(
                              '21.5',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            CustomVerticalSlider(
                                max: 100,
                                min: 20,
                                onchanged: (dynamic value) {
                                  setState(() {
                                    flow = value;
                                  });
                                },
                                value: flow),
                            Text(
                              'Head \nMts',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
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
                        Column(
                          children: [
                            Text(
                              'Flow L/S   125',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            CustomVerticalSlider(
                                max: 100,
                                min: 20,
                                onchanged: (dynamic value) {
                                  setState(() {
                                    flow = value;
                                  });
                                },
                                value: flow),
                            Text(
                              'Flow \n USGPM',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '17.3',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            CustomVerticalSlider(
                                max: 100,
                                min: 20,
                                onchanged: (dynamic value) {
                                  setState(() {
                                    flow = value;
                                  });
                                },
                                value: flow),
                            Text(
                              'Head \n Mts',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
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
