import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class RolesController{
  late BuildContext context;
  User? user;
  SharedPref pref = new SharedPref();

  late Function refresh;

  Future init(BuildContext context, Function refresh) async{
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await pref.read('user'));
    refresh();
  }

  void goToPage(String route){
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}