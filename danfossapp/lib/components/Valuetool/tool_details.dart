import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ToolDetails extends StatelessWidget {
  final String label;
  final Image? image;
  final Widget? itemwidget;

  const ToolDetails(
      {super.key, this.image, required this.label, this.itemwidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: label),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (image != null) image!,
              if (itemwidget != null) itemwidget!,
            ],
          ),
        ),
      ),
    );
  }
}
