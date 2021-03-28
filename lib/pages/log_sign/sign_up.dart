import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/firebase/firestore.dart';
import 'package:new_explorer_challenge/library/widgets/text_paragraphe.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/values/values.dart';
import 'package:new_explorer_challenge/model/responsive.dart';

class SignUp{

  SignUp(
      this.context,
      this._pageController,
      this._pseudo,
      this._email,
      this._pwd,
      this._obscureText,
      this._togglePwd,
      );

  BuildContext context;
  TextEditingController _pseudo;
  TextEditingController _email;
  TextEditingController _pwd;
  bool _obscureText;
  VoidCallback _togglePwd;
  PageController _pageController;

  Widget bodyInscription(double width){
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
              _buildHeaderInscription(),
              _buildFormInscription(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderInscription() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 215),
        child: TextTitreBouton(
          "Inscription",
          fontSize: 35,
          fontWeight: FontWeight.w500,
          color: AppColors.blackLightColor,
        ),
      ),
    );
  }

  Widget _buildFormInscription() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_48),
      child: Column(
        children: <Widget>[
          //Champ Pseudo
          ResponsiveWidget.isSmallScreen(context)
              ? pseudo(null)
              : Center(child: pseudo(300.0),),
          //Champ Email
          ResponsiveWidget.isSmallScreen(context)
              ? email(null)
              : Center(child: email(300.0)),
          //Champ Mot de passe
          ResponsiveWidget.isSmallScreen(context)
              ? password(null)
              : Center(child: password(300.0)),
          //Bouton Connexion
          ResponsiveWidget.isSmallScreen(context)
              ? Align(
            alignment: Alignment.centerLeft,
            child: boutonInscription(),
          )
              : Center(child: boutonInscription(),),
          //Text Inscription
          ResponsiveWidget.isSmallScreen(context)
              ? Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Align(
                alignment: Alignment.center,
                child: textConnexion(MainAxisAlignment.center)
            ),
          )
              : Container(
            margin: EdgeInsets.only(top: 20.0),
            child: textConnexion(MainAxisAlignment.center),
          ),
        ],
      ),
    );
  }

  Widget email(double width){
    return Container(
      width: width,
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
          color: AppColors.greyLightColor,
          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextField(
          controller: _email,
          cursorColor: AppColors.blackLightColor,
          decoration: InputDecoration(
              hintText: "Email",
              border: UnderlineInputBorder(
                  borderSide: BorderSide.none
              )
          ),
        ),
      ),
    );
  }

  Widget password(double width){
    return Container(
      width: width,
      margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
      decoration: BoxDecoration(
          color: AppColors.greyLightColor,
          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextField(
          controller: _pwd,
          obscureText: _obscureText,
          cursorColor: AppColors.blackLightColor,
          decoration: InputDecoration(
            hintText: "Mot de passe",
            border: UnderlineInputBorder(
                borderSide: BorderSide.none
            ),
            suffixIcon: GestureDetector(
              onTap: _togglePwd,
              child: (_obscureText == true)
                  ? Icon(Icons.visibility_rounded, color: Colors.grey,)
                  : Icon(Icons.visibility_off_rounded, color: AppColors.blackLightColor,),
            ),
          ),
        ),
      ),
    );
  }

  Widget pseudo(double width){
    return Container(
      width: width,
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
          color: AppColors.greyLightColor,
          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextField(
          controller: _pseudo,
          cursorColor: AppColors.blackLightColor,
          decoration: InputDecoration(
              hintText: "Pseudo",
              border: UnderlineInputBorder(
                  borderSide: BorderSide.none
              )
          ),
        ),
      ),
    );
  }

  Widget boutonInscription(){
    return ElevatedButton(
      child: TextTitreBouton(
        "Inscription",
        fontSize: 15,
        color: AppColors.greyLightColor,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            AppColors.blackLightColor
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.all(20.0)
        ),
      ),
      onPressed: () => inscription(),
    );
  }

  Widget textConnexion(MainAxisAlignment mainAxisAlignment){
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        TextParagraphe(
          "Vous êtes déjà membres ?",
          fontSize: 14.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: GestureDetector(
            child: TextParagraphe(
              "Connexion",
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            onTap: () => _pageController.previousPage(duration: Duration(seconds: 3), curve: Curves.fastOutSlowIn),
          ),
        )
      ],
    );
  }

  inscription(){
    String mail = _email.text.trim();
    String pwd = _pwd.text.trim();
    String pseudo = _pseudo.text.trim();

    if(pseudo == ""){
      return;
    }
    if(mail == ""){
      return;
    }
    if(pwd == ""){
      return;
    }

    return checkInscription();
  }

  void checkInscription(){
    isInscrit(context);
  }

  void isInscrit(BuildContext context){
    Firebase().createAccount(_email.text.trim().toLowerCase(), _pwd.text.trim().toLowerCase(), _pseudo.text.trim());
  }
}