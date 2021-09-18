import 'package:delivery_app/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class DeliveryOrdersListController{
  late BuildContext context;
  SharedPref _prefs = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  Future? init(BuildContext context){
    this.context = context;
  }

  void logout(){
    _prefs.logout(context);
  }

  void openDrawer(){
    key.currentState!.openDrawer();
  }
}