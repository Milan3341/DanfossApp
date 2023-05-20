import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:danfossapp/models/perkw_model.dart';
import 'package:danfossapp/widgets/custom_dropdown.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/chiller_model.dart';

class PerKwWidget extends StatefulWidget {
  const PerKwWidget({super.key});

  @override
  State<PerKwWidget> createState() => _PerKwWidgetState();
}

class _PerKwWidgetState extends State<PerKwWidget> {
  final jobRoleCtrl = TextEditingController();
  static Perkwdata perkwdata = const Perkwdata(
      column1: "Lesotho", column2: 0.023, powerAppsId: "rGxly8ZhkwM");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropdown.search(
            onChanged: (value) {
              setState(() {
                perkwdata = Perkwdata.perkwdatas.firstWhere(
                    (d) => d.column1 == value || d.powerAppsId == value);
              });
            },
            hintText: 'Search Country',
            selectedStyle: TextStyle(
              fontSize: 20,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            listItemStyle: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            fillColor: Theme.of(context).colorScheme.primary,
            items: Perkwdata.perkwdatas.map((e) => e.column1).toList(),
            controller: jobRoleCtrl),
        const SizedBox(height: 20),
        Text(
          'PowerAppsId: ${perkwdata.powerAppsId}',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 10),
        Text(
          'Country: ${perkwdata.column1}',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 10),
        Text(
          'Rate: ${perkwdata.column2}',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
