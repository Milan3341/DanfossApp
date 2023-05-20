import 'package:flutter/material.dart';

class CustomSlliderLabel extends StatelessWidget {
  final String label;
  final dynamic value;
  dynamic numroundedlider;
  bool display;
  CustomSlliderLabel(
      {super.key,
      this.numroundedlider = 0,
      required this.value,
      required this.label,
      this.display = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: display
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                Text(
                  value.toStringAsFixed(numroundedlider),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                )
              ],
            )
          : null,
    );
  }
}
