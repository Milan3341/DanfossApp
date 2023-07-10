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
        Column3: "Screw",
        Column4: "30XW-0352",
        Column5: 369.3,
        Column6: 5.28,
        Column7: 6.83,
        PowerAppsId: "wzokbMArU_0"),
  ];
  factory ChillerData.fromJson(Map<String, dynamic> json) {
    return ChillerData(
      Column1: json['Column1'],
      Column2: json['Column2'],
      Column3: json['Column3'],
      Column4: json['Column4'],
      Column5: double.parse(json['Column5'].toString()),
      Column6: double.parse(json['Column6'].toString()),
      Column7: double.parse(json['Column7'].toString()),
      PowerAppsId: json['PowerAppsId'],
    );
  }
}
