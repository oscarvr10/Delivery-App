import 'package:delivery_app/src/models/response.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/provider/users_provider.dart';
import 'package:delivery_app/src/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';

class RegisterController{
  late BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPwdController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();


  Future init(BuildContext context) async{
    this.context = context;
    await usersProvider.init(context);
  }

  void goToLoginPage(){
    Navigator.pop(context);
  }

  void register() async{
    String email = emailController.text.trim();
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPwd = confirmPwdController.text.trim();

    if(email.isEmpty || firstName.isEmpty || lastName.isEmpty ||
        phone.isEmpty || password.isEmpty || confirmPwd.isEmpty)
    {
      CustomSnackBar.show(context, 'Debes ingresar todos los campos');
      return;
    }

    if(confirmPwd != password){
      CustomSnackBar.show(context, 'Las contraseñas no coinciden. Revisa e intenta nuevamente');
      return;
    }

    if(password.length < 6){
      CustomSnackBar.show(context, 'La contraseña debe tener al menos 6 caracteres');
      return;
    }

    User user = new User(
        email: email,
        name: firstName,
        lastname: lastName,
        password: password,
        phone: phone
    );

    Response response = await usersProvider.create(user);
    CustomSnackBar.show(context, response.message ?? 'El usuario se ha registrado correctamente.');

    if(response.success){
      Future.delayed(Duration(seconds: 3), (){
        Navigator.pushReplacementNamed(context, 'login');
      });
    }
    print('RESPONSE: ${response.toJson()}');
  }
}