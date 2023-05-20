import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextBox extends StatelessWidget {
  final dynamic text1;
  final dynamic text2;
  final dynamic text3;
  TextDirection textDirection;
  CustomTextBox(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      this.textDirection = TextDirection.ltr});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: textDirection,
      children: [
        Expanded(
          child: Text(
            text1,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        Expanded(
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        Expanded(
          child: Text(
            text3,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        )
      ],
    );
  }
}
