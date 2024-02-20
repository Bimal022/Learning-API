import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? dataMap;
  Map<String, dynamic>? doneDataMap;
  List<dynamic>? doneDataList;
  Future hitAPI() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      setState(() {
        dataMap = jsonDecode(response.body);
        doneDataList = dataMap!['data'];
        print(doneDataList);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    hitAPI();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: doneDataList == null
          ? CupertinoActivityIndicator()
          : ListView.builder(
              itemCount: doneDataList!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(doneDataList![index]["avatar"]),
                  ),
                  title: Text(doneDataList![index]["first_name"]),
                  subtitle: Text(doneDataList![index]["email"]),
                );
              }),
    ));
  }
}
