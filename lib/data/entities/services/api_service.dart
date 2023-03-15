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
      {required String message,
      required String modelId,
      required String id}) async {
    try {
      var response = await http.post(
        Uri.parse("$BASE_URL/chat/completions"),
        headers: {
          "Authorization": "Bearer $API_KEY",
          "Content-Type": "application/json"
        },
        // body: jsonEncode({
        //   "model": modelId,
        //   "prompt": message,
        //   "max_tokens": 100,
        // }),
        body: jsonEncode(
          {
            "model": modelId,
            "messages": [
              {"role": id, "content": message}
            ]
          },
        ),
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
              msg: jsonResponse["choices"][0]["message"]["content"],
              chatIndex: jsonResponse["choices"][0]["index"]),
        );
      }
      return chatList;
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }
}
