import 'dart:convert';

import 'package:danfossapp/models/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class PostBloc extends Cubit<List<PostModelItem>> {
  PostBloc() : super([]);

  Future<void> fetchPost(String url) async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'authToken');
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<PostModelItem> postData =
            jsonData.map((json) => PostModelItem.fromJson(json)).toList();
        emit(postData);
      }
    } catch (e) {
      print(e);
      throw Exception('Something went Wrong');
    }
  }
}
