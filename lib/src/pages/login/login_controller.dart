import 'package:delivery_app/src/models/response.dart';
import 'package:delivery_app/src/provider/users_provider.dart';
import 'package:delivery_app/src/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';

class LoginController{
  late BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();

  Future init(BuildContext context) async{
    this.context = context;
    await usersProvider.init(context);
  }

  void goToRegisterPage(){
    Navigator.pushNamed(context, 'register');
  }

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    Response response = await usersProvider.login(email, password);

    CustomSnackBar.show(context, response.message ?? '');

    print('RESPONSE: ${response.toJson()}');
  }
}