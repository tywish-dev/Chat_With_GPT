import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chat_gpt_app/data/constants/api_consts.dart';
import 'package:chat_gpt_app/data/entities/modals/models_modal.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModal>> getModels() async {
    try {
      var response = await http.get(Uri.parse("$BASE_URL/models"),
          headers: {'Authorization': 'Bearer $API_KEY'});
      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // log(jsonResponse['error']['message']);
        throw HttpException(jsonResponse['error']['message']);
      }
      // print(jsonResponse);
      List temp = [];
      for (var value in jsonResponse['data']) {
        temp.add(value);
      }
      return ModelsModal.modelsFromSnapshot(temp);
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }
}
