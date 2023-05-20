import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final String label;
  final bool value;
  final void Function(bool?) ontap;
  const CustomCheckBox(
      {super.key,
      required this.ontap,
      required this.value,
      required this.label});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxMenuButton(
      value: widget.value,
      style: ButtonStyle(
        shadowColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
        surfaceTintColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
        overlayColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
        iconColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
        textStyle:
            MaterialStatePropertyAll(Theme.of(context).textTheme.bodySmall),
        foregroundColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
      ),
      onChanged: widget.ontap,
      child: Text(widget.label),
    );
  }
}
