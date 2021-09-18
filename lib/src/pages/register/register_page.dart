import 'package:delivery_app/src/pages/register/register_controller.dart';
import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController _controller = new RegisterController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -80,
              left: -100,
              child: _circleRegister(),
            ),
            Positioned(
              child: _textRegister(),
              top: 65,
              left: 27,
            ),
            Positioned(
              child: _iconBack(),
              top: 50,
              left: -5,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 160),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _imageUser(),
                    SizedBox(height: 30),
                    _emailTextField(),
                    _firstNameTextField(),
                    _lastNameTextField(),
                    _phoneTextField(),
                    _passwordTextField(),
                    _confirmPasswordTextField(),
                    _registerButton()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageUser(){
    return CircleAvatar(
      backgroundImage: AssetImage("assets/img/user_profile_2.png"),
      radius: 70,
      backgroundColor: Colors.grey[300],
    );
  }

  Widget _circleRegister() {
    return Container(
      height: 240,
      width: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor
      ),
    );
  }

  Widget _textRegister() {
    return Text(
      "REGISTRO",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'NimbusSans'
      ),
    );
  }

  Widget _iconBack() {
    return IconButton(
        onPressed: _controller.goToLoginPage,
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        )
    );
  }

  Widget _firstNameTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 6),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _controller.firstNameController,
        decoration: InputDecoration(
            hintText: "Nombre(s)",
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16),
            hintStyle: TextStyle(color: MyColors.primaryDarkColor),
            prefixIcon: Icon(
              Icons.person,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _lastNameTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 6),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _controller.lastNameController,
        decoration: InputDecoration(
            hintText: "Apellidos",
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16),
            hintStyle: TextStyle(color: MyColors.primaryDarkColor),
            prefixIcon: Icon(
              Icons.person_outline,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 6),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _controller.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: "Correo electrónico",
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16),
            hintStyle: TextStyle(color: MyColors.primaryDarkColor),
            prefixIcon: Icon(
              Icons.email,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _phoneTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 6),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _controller.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: "Núm. Celular",
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16),
            hintStyle: TextStyle(color: MyColors.primaryDarkColor),
            prefixIcon: Icon(
              Icons.phone,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 6),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _controller.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Contraseña",
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16),
            hintStyle: TextStyle(color: MyColors.primaryDarkColor),
            prefixIcon: Icon(
              Icons.lock,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _confirmPasswordTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 6),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _controller.confirmPwdController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Confirmar contraseña",
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16),
            hintStyle: TextStyle(color: MyColors.primaryDarkColor),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: MyColors.primaryColor,
            )
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
        onPressed: _controller.register,
        child: Text("REGISTRARSE"),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            padding: EdgeInsets.symmetric(vertical: 15)
        ),
      ),
    );
  }
}
