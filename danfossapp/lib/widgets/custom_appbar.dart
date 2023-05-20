import 'package:danfossapp/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 5,
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge!));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
