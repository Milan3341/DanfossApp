import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomSlider extends StatelessWidget {
  final dynamic min;
  final dynamic max;
  final double value;
  final bool enableTooltip;
  final Function(dynamic)? onchanged;
  final double interval;
  const CustomSlider(
      {super.key,
      this.interval = 100,
      this.enableTooltip = false,
      required this.max,
      required this.min,
      required this.onchanged,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return SfSlider(
        activeColor: Theme.of(context).colorScheme.primary,
        enableTooltip: enableTooltip,
        value: value,
        stepSize: 1,
        showTicks: true,
        min: min,
        max: max,
        interval: 1000,
        onChanged: onchanged);
  }
}
