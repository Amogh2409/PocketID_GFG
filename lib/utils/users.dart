import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pocketid_gfg/Register/Login.dart';

import '../HomePage/HomePage.dart';

class UserManagement with ChangeNotifier{
  

  logOut(context){
    EasyLoading.show(status: 'Logging Out...');
    Future.delayed(const Duration(seconds: 2), (){
      EasyLoading.dismiss();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Login()));
    });


  }

  // login
  // loginUser(String email, String password) async{
  //   EasyLoading.show(status: 'Logging In...');
  //   Future.delayed(const Duration(seconds: 2), (){
  //     EasyLoading.dismiss();
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MyHomePage()));
  //   });
  // }
}