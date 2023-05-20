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
        column1: "Lesotho", column2: 0.023, powerAppsId: "rGxly8ZhkwM"),
    const Perkwdata(
        column1: "Kyrgyzstan", column2: 0.03, powerAppsId: "qTRxSJc-wqg")
  ];
}
