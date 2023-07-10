import 'package:equatable/equatable.dart';

class Perkwdata extends Equatable {
  final String column1;
  final double column2;
  final String powerAppsId;
  const Perkwdata(
      {required this.column1,
      required this.column2,
      required this.powerAppsId});

  @override
  List<Object?> get props => [column1, column2, powerAppsId];

  static List<Perkwdata> perkwdatas = [
    const Perkwdata(
        column1: "Sudan", column2: 0.00, powerAppsId: "C6YHhY-UtiA"),
  ];
  factory Perkwdata.fromJson(Map<String, dynamic> json) {
    return Perkwdata(
      column1: json['Column1'].toString(),
      column2: json['Column2'] != null
          ? double.parse(json['Column2'].toString())
          : 0.0,
      powerAppsId: json['PowerAppsId'].toString(),
    );
  }
}
