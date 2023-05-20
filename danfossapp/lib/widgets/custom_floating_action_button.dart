import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import 'custom_checkbox.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final List<Widget> children;

  const CustomFloatingActionButton({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      distance: 55,
      backgroundColor: Theme.of(context).colorScheme.primary,
      overlayStyle: ExpandableFabOverlayStyle(blur: 2),
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      closeButtonStyle: ExpandableFabCloseButtonStyle(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Theme.of(context).colorScheme.primary),
      type: ExpandableFabType.up,
      children: children,
    );
  }
}
