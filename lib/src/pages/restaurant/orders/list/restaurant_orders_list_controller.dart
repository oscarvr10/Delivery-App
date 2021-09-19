import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class RestaurantOrdersListController{
  late BuildContext context;
  SharedPref _prefs = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  User? user;
  late Function refresh;

  Future init(BuildContext context, Function refresh) async{
    this.context = context;
    user = User.fromJson(await _prefs.read('user'));
    refresh();
  }

  void logout(){
    _prefs.logout(context);
  }

  void openDrawer(){
    key.currentState!.openDrawer();
  }

  void goToRoles(){
    Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
  }
}