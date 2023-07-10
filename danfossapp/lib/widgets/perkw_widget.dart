import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:danfossapp/bloc/PerKW.dart';
import 'package:danfossapp/models/perkw_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PerKwWidget extends StatefulWidget {
  const PerKwWidget({super.key});

  @override
  State<PerKwWidget> createState() => _PerKwWidgetState();
}

class _PerKwWidgetState extends State<PerKwWidget> {
  final jobRoleCtrl = TextEditingController();
  Perkwdata selectedPerkw = Perkwdata.perkwdatas[0];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PerkwBloc, List<Perkwdata>>(
        builder: (context, perkwdata) {
      if (perkwdata == null || perkwdata.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Column(
          children: [
            CustomDropdown.search(
                onChanged: (value) {
                  setState(() {
                    selectedPerkw = perkwdata.firstWhere(
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
                items: perkwdata
                    .map((e) => e.column1)
                    .where((item) => item != null)
                    .toList(),
                controller: jobRoleCtrl),
            const SizedBox(height: 20),
            Text(
              'PowerAppsId: ${selectedPerkw.powerAppsId}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Country: ${selectedPerkw.column1}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Rate: ${selectedPerkw.column2}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        );
      }
    });
  }
}
