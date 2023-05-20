import 'package:carousel_slider/carousel_slider.dart';
import 'package:danfossapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../config/routing.dart';
import '../models/models.dart';
import 'carousel_card.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Danfoss'),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Welcome \n Milan',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.red)),
                      Container(
                        height: 50,
                        child: Image.asset('assets/images/danfoss.png'),
                      )
                      // Text('Engineering \nTommorow',
                      //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      //         color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 500,
                    aspectRatio: 0.860,
                    viewportFraction: 0.75,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    autoPlay: true,
                  ),
                  items: [
                    CarousalCard(
                      data: dataList[0],
                      ontap: () {
                        Navigator.pushNamed(
                            context, MyCustomroutes.chillerRoute);
                      },
                    ),
                    CarousalCard(
                      data: dataList[1],
                      ontap: () {
                        Navigator.pushNamed(context, MyCustomroutes.hydroRoute);
                      },
                    ),
                    CarousalCard(
                      data: dataList[2],
                      ontap: () {
                        Navigator.pushNamed(context, MyCustomroutes.valueRoute);
                      },
                    ),
                  ],

                  // items: dataList
                  //     .map((data) => CarousalCard(
                  //           data: data,
                  //         ))
                  //     .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
