import 'package:danfossapp/widgets/perkw_widget.dart';
import 'package:danfossapp/widgets/video_player.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ValueToolData extends Equatable {
  final Icon icons;
  final String label;
  final Image? image;
  final Widget? itemwidget;

  const ValueToolData(
      {required this.icons, this.image, required this.label, this.itemwidget});

  @override
  List<Object?> get props => [icons, label, image];

  static List<ValueToolData> valueDatas = [
    ValueToolData(
        icons: const Icon(
          Icons.local_car_wash,
        ),
        image: Image.asset('assets/images/OilDeg.png'),
        label: 'Oil Degradation'),
    const ValueToolData(
        label: 'Oil Degradation Video',
        icons: Icon(Icons.video_library),
        itemwidget: CustomVideoPlayer()),
    const ValueToolData(
        icons: Icon(FontAwesomeIcons.globe),
        label: 'Global Power',
        itemwidget: PerKwWidget()),
    ValueToolData(
        icons: const Icon(Icons.water_drop),
        label: 'IPLV Water',
        image: Image.asset('assets/images/IPLVWater.png')),
    ValueToolData(
        icons: const Icon(Icons.air),
        label: 'IPLV Air',
        image: Image.asset('assets/images/IPLVAir.png')),
    ValueToolData(
        icons: const Icon(Icons.bar_chart),
        label: 'IPLV ECWT',
        image: Image.asset('assets/images/ECWTCop.png')),
    ValueToolData(
        icons: const Icon(Icons.show_chart),
        label: 'LCHW Air',
        image: Image.asset('assets/images/PerformenceAC2.png')),
    ValueToolData(
        icons: const Icon(Icons.trending_up),
        label: 'LCHW Water',
        image: Image.asset('assets/images/PerformenceWC2.png')),
    ValueToolData(
        icons: const Icon(Icons.analytics),
        label: 'Plant Eff',
        image: Image.asset('assets/images/PlantEff.png')),
    ValueToolData(
        icons: const Icon(Icons.monetization_on_outlined),
        label: 'USDKWR',
        image: Image.asset('assets/images/USDperKW.png')),
    ValueToolData(
        icons: const Icon(Icons.fitness_center),
        label: 'USDTon',
        image: Image.asset('assets/images/USDperTon.png')),
    ValueToolData(
        icons: const Icon(Icons.rocket),
        label: 'Performance',
        image: Image.asset('assets/images/COVSOF.png')),
    ValueToolData(
        icons: const Icon(Icons.thermostat),
        label: 'IPLVWT',
        image: Image.asset('assets/images/IPLVWT.png')),
    ValueToolData(
        icons: const Icon(Icons.bug_report),
        label: 'DTC',
        image: Image.asset('assets/images/History.png')),
  ];
}
