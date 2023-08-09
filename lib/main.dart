import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart';

import 'models/user_models.dart';

void main(List<String> args) async {
  Uri uri = Uri.parse('https://dummyjson.com/users/5');

  Response response = await get(uri);

  UserModel userModel = UserModel.fromMap(jsonDecode(response.body));

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('${userModel.firstName} ${userModel.lastName}'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Image(
          image: NetworkImage('${userModel.image}'),
          width: 200,
          height: 200,
        ),
      ),
    ),
  ));
}
