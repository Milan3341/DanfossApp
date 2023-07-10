import 'dart:convert';
import 'package:danfossapp/models/perkw_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class PerkwBloc extends Cubit<List<Perkwdata>> {
  PerkwBloc() : super([]);
  Future<void> fetchPerkw(String url) async {
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
        List<Perkwdata> perkwdata =
            jsonData.map((json) => Perkwdata.fromJson(json)).toList();
        emit(perkwdata);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load data');
    }
  }
}
