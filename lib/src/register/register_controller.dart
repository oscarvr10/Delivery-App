import 'package:flutter/material.dart';

class RegisterController{
  late BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPwdController = new TextEditingController();

  Future? init(BuildContext context){
    this.context = context;
  }

  void goToLoginPage(){
    Navigator.pop(context);
  }

  void register(){
    String email = emailController.text.trim();
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPwd = confirmPwdController.text.trim();

    print('Email: $email');
    print('Nombre: $firstName');
    print('Apellidos: $lastName');
    print('Telefono: $phone');
    print('Password: $password');
    print('Confirmar Password: $confirmPwd');
  }
}