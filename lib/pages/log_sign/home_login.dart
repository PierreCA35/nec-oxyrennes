
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_explorer_challenge/library/widgets/text_paragraphe.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/model/responsive.dart';
import 'package:new_explorer_challenge/pages/log_sign/login_signup_page.dart';
import 'package:new_explorer_challenge/values/values.dart';

class HomeLogin extends StatefulWidget{

  @override
  _HomeLoginState createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
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
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: AppColors.beigeColor,
          ),
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.20,
                child: bodyHomeLogin(widthOfScreen, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodyHomeLogin(double width, BuildContext context){
    return Stack(
      children: [
        Positioned(
          top: 20.0,
          child: Center(
            child: Container(
              height: 180,
              child: Image.asset(
                "assets/adventure.png",
                width: width,
              ),
            ),
          ),
        ),
        Positioned(
          child: ListView(
            children: [
              _buildHeaderHomeLogin(),
              _buildFormConnexion(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFormConnexion(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_48),
      child: Column(
        children: <Widget>[
          //Text
          ResponsiveWidget.isSmallScreen(context)
          ? Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Align(
              alignment: Alignment.center,
              child: textHomeLogin(),
            ),
          )
          : Container(
            margin: EdgeInsets.only(top: 30.0),
            child: textHomeLogin(),
          ),
          //Bouton Connexion
          ResponsiveWidget.isSmallScreen(context)
              ? Align(
            alignment: Alignment.centerLeft,
            child: boutonConnexion(270.0, context),
          )
              : Center(child: boutonConnexion(270.0, context),),
          //Text Inscription
          ResponsiveWidget.isSmallScreen(context)
              ? Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Align(
                alignment: Alignment.center,
                child: textInscription(MainAxisAlignment.center, context)
            ),
          )
              : Container(
            margin: EdgeInsets.only(top: 20.0),
            child: textInscription(MainAxisAlignment.center, context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderHomeLogin() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 215),
        child: TextTitreBouton(
          "Bienvenue",
          fontSize: 40,
          fontWeight: FontWeight.w500,
          color: AppColors.blackLightColor,
        ),
      ),
    );
  }

  Widget textHomeLogin(){
    return TextParagraphe(
      "Connectez-vous afin de pouvoir partager le contenu de vos aventures.",
      color: AppColors.blackLightColor,
      fontSize: 14.0,
    );
  }

  Widget boutonConnexion(double width, BuildContext context){
    return Container(
      width: width,
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: ElevatedButton(
        child: TextTitreBouton(
          "Connexion",
          fontSize: 15,
          color: AppColors.greyLightColor,
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(6.0),
          backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.blackLightColor
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.only(top: 25.0, bottom: 25.0, left: 10.0, right: 130.0)
          ),
        ),
        onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginSignUpPage())),
      ),
    );
  }

  Widget textInscription(MainAxisAlignment mainAxisAlignment, BuildContext context){
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        TextParagraphe(
          "Vous n'êtes pas membres ?",
          fontSize: 14.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: GestureDetector(
            child: TextParagraphe(
              "Inscription",
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginSignUpPage())),
          ),
        )
      ],
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
}