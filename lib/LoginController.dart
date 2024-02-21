import 'dart:convert';
import 'package:get/get.dart';
import 'package:first_api/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController with ChangeNotifier {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  userLogin(
    TextEditingController textEmailController,
    TextEditingController textPasswordController,
  ) async {
    try {
      var headers = {"content-type": "application/json"};
      var body = {
        "email": textEmailController.text.trim(),
        "password": textPasswordController.text.trim(),
      };
      http.Response response;
      response = await http.post(
        Uri.parse("https://reqres.in/api/login"),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        // Check if token is present and not empty
        if (jsonResponse.containsKey('token') &&
            jsonResponse['token'] != null) {
          Get.to(() => HomeScreen());
        } else {
          // Handle case where token is not present or empty
        }
      }
    } catch (e) {
      print("exception $e");
      // Handle error appropriately
    }
  }
}
