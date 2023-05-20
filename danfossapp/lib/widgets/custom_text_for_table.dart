import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextForTable extends StatelessWidget {
  final String text;
  const CustomTextForTable({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground));
  }
}
