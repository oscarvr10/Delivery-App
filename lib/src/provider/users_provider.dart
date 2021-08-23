import 'dart:convert';
import 'package:delivery_app/src/api/environment.dart';
import 'package:delivery_app/src/models/response.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersProvider {
  String _url = Environment.API_URL;
  String _api = '/api/users';

  late BuildContext context;

  Future? init(BuildContext context){
    this.context = context;
  }

  Future<Response> create(User user) async{
    try{
      Uri url = Uri.http(_url, '$_api/create');
      String params = json.encode(user);
      Map<String, String> headers = {
        'Content-Type': 'application/json'
      };

      return _sendRequestAsync(url, params);
    }
    catch(e){
      print('Error $e');
      throw e;
    }
  }

  Future<Response> login(String email, String password) async{
    try{
      Uri url = Uri.http(_url, '$_api/login');
      String params =  json.encode({
        'email': email,
        'password': password
      });

      return _sendRequestAsync(url, params);
    }
    catch(e){
      print('Error $e');
      throw e;
    }
  }

  Future<Response> _sendRequestAsync(Uri url, String params) async{
    Map<String, String> headers = {
      'Content-Type': 'application/json'
    };
    final res = await http.post(url,headers: headers, body: params);
    final data = json.decode(res.body);
    Response response = Response.fromJson(data);
    return response;
  }
}