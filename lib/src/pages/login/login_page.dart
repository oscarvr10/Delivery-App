import 'package:delivery_app/src/pages/login/login_controller.dart';
import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _controller = new LoginController();

  @override
  void initState() {
    // Se ejecuta al inicializar la vista
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      print('SCHEDULER BINDING');
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
              child: _circleLogin(),
            ),
            Positioned(
              child: _textLogin(),
              top: 65,
              left: 25,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  //_bannerImage(context: context),
                  _lottieAnimation(),
                  _emailTextField(),
                  _passwordTextField(),
                  _loginButton(),
                  _registerLabel()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lottieAnimation() {
    return Container(
      margin: EdgeInsets.only(
        top: 80,
        bottom: MediaQuery
            .of(context)
            .size
            .height * 0.26,
      ),
      child: Lottie.asset(
          "assets/json/delivery.json",
          width: 350,
          height: 210,
          fit: BoxFit.cover
      ),
    );
  }

  Widget _textLogin() {
    return Text(
      "LOGIN",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'NimbusSans'
      ),
    );
  }

  Widget _circleLogin() {
    return Container(
      height: 240,
      width: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor
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
        //Asignar controller al textfield
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

  Widget _passwordTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 6),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        //Asignar controller al textfield
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

  Widget _registerLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "¿No tienes cuenta?",
          style: TextStyle(
              color: MyColors.primaryColor
          ),
        ),
        SizedBox(width: 6),
        GestureDetector(
          onTap: _controller.goToRegisterPage,
          child: Text(
            "Regístrate",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
        onPressed: _controller.login,
        child: Text("INGRESAR"),
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
//NOTAS:

//Column: Posiciona elementos de forma vertical
//Row: Posiciona elementos de forma horizontal
//Stack: Posiciona elementos uno encima del otro
//mainAxisAlignment.spaceAround: Posiciona elementos CON margen entre cada uno de forma justificada
//mainAxisAlignment.spaceEvenly: Posiciona elementos CON margen entre cada uno de forma centrada
//mainAxisAlignment.spaceBetween: Posiciona elementos SIN margen entre cada uno de forma justificada