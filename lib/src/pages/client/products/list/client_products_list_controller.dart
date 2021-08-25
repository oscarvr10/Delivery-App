import 'package:delivery_app/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class ClientProductsListController{
  late BuildContext context;

  SharedPref _prefs = new SharedPref();

  Future? init(BuildContext context){
    this.context = context;
  }

  void logout(){
    _prefs.logout(context);
  }
}