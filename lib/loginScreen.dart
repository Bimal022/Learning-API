// ignore: non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_api/LoginController.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      body: Container(
        // ignore: non_constant_identifier_names
        child: Consumer<LoginController>(
          builder: (context, loginValues, child) {
            return Form(
              key: loginValues.loginFormKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (loginValues.loginFormKey.currentState!
                            .validate()) {}
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
