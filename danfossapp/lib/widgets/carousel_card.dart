import 'package:flutter/material.dart';

import '../models/models.dart';

class CarousalCard extends StatelessWidget {
  final Function ontap;
  final DataModel data;
  const CarousalCard({super.key, required this.data, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          ontap();
        },
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 4), blurRadius: 4, color: Colors.black26)
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: Image.asset(
                    data.imageName,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(data.title, style: Theme.of(context).textTheme.bodyLarge),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 10, left: 6),
                  child: Text(
                    data.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
