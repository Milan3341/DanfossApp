import 'dart:async';
import 'dart:convert';
import 'package:danfossapp/models/chiller_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class DataBloc extends Cubit<List<ChillerData>> {
  DataBloc() : super([]);
  late ChillerData selectedData2 = const ChillerData(
      Column1: "Water Cooled",
      Column2: "CARRIER",
      Column3: "Screw",
      Column4: "30XW-0352",
      Column5: 369.3,
      Column6: 5.28,
      Column7: 6.83,
      PowerAppsId: "wzokbMArU_0");
  late ChillerData selectedData = const ChillerData(
      Column1: "Air Cooled",
      Column2: "TRANE  ",
      Column3: "Screw ",
      Column4: "RTAA 100",
      Column5: 354,
      Column6: 2.84,
      Column7: 3.69,
      PowerAppsId: "Z8bTucwLH1I");

  Future<void> fetchData(String url) async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'authToken');
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        List<ChillerData> chillerData =
            jsonData.map((json) => ChillerData.fromJson(json)).toList();
        emit(chillerData);
        ;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
