import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '/data/constants/api_consts.dart';
import '/data/entities/modals/chat_modal.dart';
import '/data/entities/modals/models_modal.dart';
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

  static Future<List<ChatModal>> sendMessage(
      {required String message, required String modelId}) async {
    try {
      var response = await http.post(
        Uri.parse("$BASE_URL/completions"),
        headers: {
          "Authorization": "Bearer $API_KEY",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "model": modelId,
          "prompt": message,
          "max_tokens": 100,
        }),
      );
      Map jsonResponse = jsonDecode(response.body);
      print(modelId);
      if (jsonResponse['error'] != null) {
        // log(jsonResponse['error']['message']);
        throw HttpException(jsonResponse['error']['message']);
      }
      List<ChatModal> chatList = [];
      if (jsonResponse['choices'].length > 0) {
        // log("jsonresponse ${jsonResponse['choices'][0]['text']}");
        chatList = List.generate(
          jsonResponse["choices"].length,
          (index) => ChatModal(
              msg: jsonResponse["choices"][index]["text"],
              chatIndex: jsonResponse["choices"][index][1]),
        );
      }
      return chatList;
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }
}
