import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomVerticalSlider extends StatelessWidget {
  final dynamic min;
  final dynamic max;
  final double value;
  final bool enableTooltip;
  final Function(dynamic)? onchanged;
  final double interval;
  final SliderTooltipPosition tooltipPosition;
  const CustomVerticalSlider(
      {super.key,
      this.interval = 100,
      this.enableTooltip = true,
      required this.max,
      required this.min,
      this.tooltipPosition = SliderTooltipPosition.left,
      required this.onchanged,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return SfSlider.vertical(
        tooltipPosition: tooltipPosition,
        enableTooltip: enableTooltip,
        value: value,
        stepSize: 1,
        showTicks: true,
        min: min,
        max: max,
        interval: interval,
        onChanged: onchanged);
  }
}
