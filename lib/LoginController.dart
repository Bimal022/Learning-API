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
    print("Entered this block of code");
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
      print("Noww Here");
      if (response.statusCode == 200) {
        print("Response successfull");
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        // Check if token is present and not empty
        print("jsonResponse['token']: $jsonResponse['token']");
        if (jsonResponse.containsKey('token') &&
            jsonResponse['token'] != null) {
          Get.to(() => HomeScreen());
        } else {}
      } else {
        print("Response code not equal to 200");
        print(response.statusCode);
      }
    } catch (e) {
      print("exception $e");
      // Handle error appropriately
    }
  }
}
