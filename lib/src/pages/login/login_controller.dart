import 'package:delivery_app/src/models/response.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/provider/users_provider.dart';
import 'package:delivery_app/src/utils/custom_snackbar.dart';
import 'package:delivery_app/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class LoginController{
  late BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();
  SharedPref _prefs = new SharedPref();

  Future init(BuildContext context) async{
    this.context = context;
    await usersProvider.init(context);
    if(await _prefs.contains('user')){
      User user = User.fromJson(await _prefs.read('user') ?? {});
      print('Usuario: ${user.toJson()}');

      if(user.sessionToken != null){
        Navigator.pushNamedAndRemoveUntil(context, 'client/products/list', (route) => false);
      }
    }
  }

  void goToRegisterPage(){
    Navigator.pushNamed(context, 'register');
  }

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    Response response = await usersProvider.login(email, password);
    print('RESPONSE: ${response.toJson()}');

    if(response.success){
      User user = User.fromJson(response.data);
      _prefs.save('user', user.toJson());

      if(user.roles!.length > 1){
        Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
      } else{
        Navigator.pushNamedAndRemoveUntil(context, user.roles![0].route, (route) => false);
      }
    }
    else{
      CustomSnackBar.show(context, response.message ?? 'Hubo un error al autenticarse. Intenta nuevamente.');
    }
  }
}