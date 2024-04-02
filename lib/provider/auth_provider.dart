import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'config.dart';
import 'user_provider.dart';

class AuthProvider extends ChangeNotifier {
  static Future<String?> loginUser(String email, String password) async {
    try {
      var reqBody = {"email": email, "password": password};

      var response = await http.post(
        Uri.parse(login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['message'] == 'User logged in successfully') {
          print('Login successful');
          return jsonResponse['token'];
        } else {
          print('Authentication failed: ${jsonResponse['message']}');
          return null;
        }
      } else {
        print('Server error: ${response.statusCode}');
        print('Server error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error logging in: $e');
      return null;
    }
  }

  static Future<bool> registerUser(String email, String password) async{
    try{
      var reqBody = {"email": email, "password": password};

      var response = await http.post(
        Uri.parse(register),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
        
      );

      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        if(jsonResponse['message'] == 'User registered successfully'){
          print('Registration successful');
          return true;
        }
        else{
          print('Registration failed: ${jsonResponse['message']}');
          return false;
        }
      }
      else{
        print('Server error: ${response.statusCode}');
        print('Server error: ${response.body}');
        return false;
      }
    }
    catch (e){
      print('Error registering: $e');
      return false;
    }
  }

}
