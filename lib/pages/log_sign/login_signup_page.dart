import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/model/responsive.dart';
import 'package:new_explorer_challenge/values/values.dart';

class LoginSignUpPage extends StatefulWidget {

  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUpPage> {

  PageController _pageController;
  TextEditingController _email;
  TextEditingController _pwd;
  TextEditingController _pseudo;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
        body: Container(
          color: AppColors.beigeColor,
          child: Container(),
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