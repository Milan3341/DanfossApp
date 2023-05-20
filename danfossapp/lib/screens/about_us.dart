import 'package:danfossapp/config/theme.dart';
import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:danfossapp/widgets/custom_bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'About'),
        body: Column(children: [
          TabBar(
            padding: EdgeInsets.only(bottom: 20),
            indicatorColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.primary,
            controller: _tabController,
            labelStyle: Theme.of(context).textTheme.displaySmall,
            tabs: const [
              Tab(
                icon: Icon(Icons.ac_unit),
                text: 'Chiller',
              ),
              Tab(
                icon: Icon(Icons.plumbing_sharp),
                text: "Hydonic Tools",
              ),
            ],
          ),
          Expanded(
              child: TabBarView(controller: _tabController, children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      'Chiller ROI',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Chiller ROI (Return on Investment) is a term used to describe the financial benefits that can be obtained by installing an efficient chiller system. A chiller is a machine that removes heat from a liquid via a refrigeration cycle. It is commonly used to cool large commercial or industrial buildings such as hospitals, universities, and factories. \n  \nBy installing an energy-efficient chiller system, the building owner can reduce energy consumption and save on operating costs. The ROI calculation typically takes into account the initial capital investment, operating costs, and expected energy savings over the life of the chiller system. A shorter payback period indicates a higher ROI, and a longer payback period indicates a lower ROI. \n \nThere are many factors that can affect the chiller ROI, such as the efficiency of the chiller system, the size of the building, and the local energy rates. Therefore, it's important to carefully consider these factors when evaluating the ROI of a chiller system before making any investment decisions.",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      'Hydonic Tools',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Danfoss is a company that manufactures a wide range of products for heating, cooling, and energy-efficient solutions. They offer a variety of hydronic tools that are designed to help professionals design, install, and maintain hydronic systems for optimal performance and energy efficiency. \n \n 1.  Some of the hydronic tools offered by Danfoss include: \n \n 2. Balancing valves: Used to balance the flow of water through the hydronic system, ensuring that each radiator or terminal unit receives the correct amount of water flow and temperature. \n \n 3.  Temperature controllers: Used to regulate the temperature of the water in the hydronic system, ensuring that it stays within the desired range. \n \n  4. Pressure gauges: Used to monitor the pressure in the hydronic system, ensuring that it stays within safe limits.\n \n  5. Thermostats: Used to control the temperature of the indoor space by adjusting the flow of hot water through the radiators or terminal units.\n \n  6. Flow meters: Used to measure the flow rate of water through the hydronic system, ensuring that it is balanced and efficient. \n \n  7. Heat exchangers: Used to transfer heat between two fluids in the hydronic system, such as between the water in the boiler and the water in the hydronic loop. \n \n  8.These hydronic tools can help professionals optimize the performance of hydronic systems, improve energy efficiency, and reduce operating costs.",
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
              ),
            )
          ]))
        ]));
  }
}
