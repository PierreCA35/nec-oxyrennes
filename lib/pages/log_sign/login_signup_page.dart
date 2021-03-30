import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/model/responsive.dart';
import 'package:new_explorer_challenge/pages/log_sign/login.dart';
import 'package:new_explorer_challenge/pages/log_sign/sign_up.dart';
import 'package:new_explorer_challenge/values/values.dart';

class LoginSignUpPage extends StatefulWidget {

  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUpPage> {

  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  TextEditingController _email;
  TextEditingController _pwd;
  TextEditingController _pseudo;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _pwd = TextEditingController();
    _pseudo = TextEditingController();
  }

  @override
  void dispose() {
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
            child: topMenu(),
            preferredSize: Size(screenSize.width, 1000)
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.beigeColor,
            ),
            child: ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.20,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page){
                      setState(() {
                        currentPage = page;
                      });
                    },
                    children: [
                      Login(
                        context,
                        _pageController,
                        _email,
                        _pwd,
                        _obscureText,
                        _togglePwd
                      ).bodyConnexion(widthOfScreen),
                      SignUp(
                        context,
                        _pageController,
                        _pseudo,
                        _email,
                        _pwd,
                        _obscureText,
                        _togglePwd
                      ).bodyInscription(widthOfScreen),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topMenu(){
    return Container(
      color: AppColors.blackLightColor,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: TextTitreBouton(
                "Accueil",
                color: AppColors.greyLightColor,
              ),
              onTap: null,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: GestureDetector(
                child: TextTitreBouton(
                  "Recherche",
                  color: AppColors.greyLightColor,
                ),
                onTap: null,
              ),
            ),
            GestureDetector(
              child: TextTitreBouton(
                "Profil",
                color: AppColors.greyLightColor,
              ),
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }

  void _togglePwd(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}