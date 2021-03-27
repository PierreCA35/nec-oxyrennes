
import 'package:firebase_core_web/firebase_core_web_interop.dart';
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/model/responsive.dart';
import 'package:new_explorer_challenge/pages/log_sign/login.dart';
import 'package:new_explorer_challenge/pages/log_sign/sign_up.dart';
import 'package:new_explorer_challenge/pages/top_menu.dart';
import 'package:new_explorer_challenge/values/values.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginSignUpPage extends StatefulWidget {

  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUpPage> with SingleTickerProviderStateMixin{

  TextEditingController _email;
  TextEditingController _pwd;
  TextEditingController _pseudo;
  bool _obscureText = true;

  AnimationController _animationController;
  CurvedAnimation _curvedAnimation;
  Duration _duration = Duration(seconds: 1);
  bool isAnim = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: _duration,
      vsync: this,
    );
    _curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.linear, reverseCurve: Curves.linear);
    _pseudo = TextEditingController();
    _email = TextEditingController();
    _pwd = TextEditingController();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _email.dispose();
    _pwd.dispose();
    _pseudo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
        ? new AppBar(
          backgroundColor: AppColors.blackLightColor,
          centerTitle: true,
          title: Container(
            height: 100,
            width: 100,
            child: Image.asset("assets/logo_NEC_.png")),
        )
        : PreferredSize(
          child: TopMenu().topMenu(),
          preferredSize: Size(screenSize.width, 1000)
        ),
        body: Container(
          child: FlutterLogin(
            onSignup: null,
            onLogin: null,
            onRecoverPassword: null,
            messages: LoginMessages(
              loginButton: "Connexion",
              signupButton: "Inscription",
              goBackButton: "Retour",
              passwordHint: "Mot de passe",
              forgotPasswordButton: "Mot de passe oublié ?",
              recoverPasswordIntro: "Réinitialiser mon mot de passe",
              recoverPasswordDescription: "Nous vous enverrons un email pour réinitialiser votre mot de passe",
              recoverPasswordButton: "Réinitialiser",
              confirmPasswordHint: "Confirmer mot de passe",
              recoverPasswordSuccess: "Email de confirmation envoyé",
              confirmPasswordError: "Mot de passe incorrect",
            ),
            title: "",
            logo: "assets/joyride.png",
            theme: LoginTheme(
              pageColorLight: AppColors.beigeColor,
              pageColorDark: AppColors.beigeColor,
              titleStyle: TextStyle(
                color: AppColors.blackLightColor
              ),
              cardTheme: CardTheme(
                color: Colors.transparent,
                elevation: 0.0,
              ),
              buttonStyle: TextStyle(
                color: AppColors.greyLightColor,
              ),
              buttonTheme: LoginButtonTheme(
                backgroundColor: AppColors.blackLightColor,
              ),
              bodyStyle: TextStyle(
                color: AppColors.blackLightColor,
              ),
              inputTheme: InputDecorationTheme(
                border: InputBorder.none,
                labelStyle: TextStyle(
                  color: Colors.grey
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePwd(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  performTransition(){
    if(isAnim){
      _animationController.reverse();
    }else{
      _animationController.forward();
    }
    isAnim = !isAnim;
  }
}

