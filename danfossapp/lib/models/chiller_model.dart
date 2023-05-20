import 'package:equatable/equatable.dart';

class ChillerData extends Equatable {
  final String Column1;
  final String Column2;
  final String Column3;
  final String Column4;
  final double Column5;
  final double Column6;
  final double Column7;
  final String PowerAppsId;
  const ChillerData(
      {required this.Column1,
      required this.Column2,
      required this.Column3,
      required this.Column4,
      required this.Column5,
      required this.Column6,
      required this.Column7,
      required this.PowerAppsId});

  @override
  // TODO: implement props
  List<Object?> get props => [
        Column1,
        Column2,
        Column3,
        Column4,
        Column5,
        Column6,
        Column7,
        PowerAppsId
      ];

  static List<ChillerData> chillerdatalist = [
    const ChillerData(
        Column1: "Air Cooled",
        Column2: "TRANE  ",
        Column3: "Screw ",
        Column4: "RTAA 100",
        Column5: 354,
        Column6: 2.84,
        Column7: 3.69,
        PowerAppsId: "Z8bTucwLH1I"),
    const ChillerData(
        Column1: "Water Cooled",
        Column2: "CARRIER",
        Column3: "Screw ",
        Column4: "30HXC106",
        Column5: 355,
        Column6: 4.87,
        Column7: 6.74,
        PowerAppsId: "2xfiRoRi9wU"),
    const ChillerData(
        Column1: "Air Cooled",
        Column2: "DAIKIN",
        Column3: "Screw VSD ",
        Column4: "EWAQ350F-XL",
        Column5: 355,
        Column6: 3.10,
        Column7: 4.58,
        PowerAppsId: "8wtVG-lj1EI"),
    const ChillerData(
        Column1: "Water Cooled",
        Column2: "YORK",
        Column3: "Screw",
        Column4: "YEWS100HA5xE",
        Column5: 355,
        Column6: 5.21,
        Column7: 6.21,
        PowerAppsId: "r2du0XfYCZw")
  ];
}
