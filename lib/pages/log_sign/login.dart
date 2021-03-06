
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/firebase/firestore.dart';
import 'package:new_explorer_challenge/library/widgets/text_paragraphe.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/model/responsive.dart';
import 'package:new_explorer_challenge/values/values.dart';

class Login{

  BuildContext context;
  PageController _pageController;
  TextEditingController _email;
  TextEditingController _pwd;
  bool _obscureText;
  VoidCallback _togglePwd;

  Login(this.context, this._pageController, this._email, this._pwd, this._obscureText, this._togglePwd);

  Widget bodyConnexion(double width){
    return Stack(
      children: [
        Positioned(
          top: 20.0,
          child: Center(
            child: Container(
              height: 180,
              child: Image.asset(
                "assets/joyride.png",
                width: width,
              ),
            ),
          ),
        ),
        Positioned(
          child: ListView(
            children: [
              _buildHeaderConnexion(),
              _buildFormConnexion(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderConnexion() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 215),
        child: TextTitreBouton(
          "Connexion",
          fontSize: 40,
          fontWeight: FontWeight.w500,
          color: AppColors.blackLightColor,
        ),
      ),
    );
  }

  Widget _buildFormConnexion() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.MARGIN_48),
      child: Column(
        children: <Widget>[
          //Champ Email
          ResponsiveWidget.isSmallScreen(context)
              ? email(null)
              : Center(child: email(300.0)),
          //Champ Mot de passe
          ResponsiveWidget.isSmallScreen(context)
              ? password(null)
              : Center(child: password(300.0)),
          //Mot de passe oubli??
          ResponsiveWidget.isSmallScreen(context)
              ? Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
              child: GestureDetector(
                child: TextParagraphe(
                  "Mot de passe oubli?? ?",
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                onTap: () => resetPwd(),
              ),
            ),
          )
              : Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Center(
              child: GestureDetector(
                child: TextParagraphe(
                  "Mot de passe oubli?? ?",
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
                onTap: () => resetPwd(),
              ),
            ),
          ),
          //Bouton Connexion
          ResponsiveWidget.isSmallScreen(context)
              ? Align(
            alignment: Alignment.centerLeft,
            child: boutonConnexion(),
          )
              : Center(child: boutonConnexion(),),
          //Text Inscription
          ResponsiveWidget.isSmallScreen(context)
              ? Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Align(
                alignment: Alignment.center,
                child: textInscription(MainAxisAlignment.center)
            ),
          )
              : Container(
            margin: EdgeInsets.only(top: 20.0),
            child: textInscription(MainAxisAlignment.center),
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
            hintText: "Mot de passe (6 min)",
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

  Widget boutonConnexion(){
    return ElevatedButton(
      child: TextTitreBouton(
        "Connexion",
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
      onPressed: () => checkConnexion(),
    );
  }

  Widget textInscription(MainAxisAlignment mainAxisAlignment){
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        TextParagraphe(
          "Vous n'??tes pas membres ?",
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
            onTap: (){
              _pageController.nextPage(duration: Duration(seconds: 3), curve: Curves.fastOutSlowIn);
            },
          ),
        )
      ],
    );
  }

  void checkConnexion(){
    String mail = _email.text.trim();
    String pwd = _pwd.text.trim();

    if(mail != ""){
      if(pwd != ""){
        isConnecte(context);
      }
    }
  }

  Future<void> isConnecte(BuildContext context) async{
    TextTitreBouton title = TextTitreBouton(
      "Conditons G??n??rales d'Utilisation",
      textAlign: TextAlign.center,
      color: AppColors.blackLightColor,
      fontSize: 18.0,
    );
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx){
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 10.0, right: 0.0, left: 0.0, bottom: 8.0),
          title: Container(
            height: 180,
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 15, left: 10.0, right: 10.0),
                    child: title,
                  ),
                  TextButton(
                    child: TextParagraphe(
                      "CGU",
                      color: AppColors.blackLightColor,
                    ),
                    onPressed: null,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 50,
                    width: 150,
                    child: TextButton(
                      child: TextTitreBouton(
                        "Accepter",
                        textAlign: TextAlign.center,
                        color: AppColors.beigeColor,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.blackLightColor)
                      ),
                      onPressed: (){
                        FirebaseClass().connectAccount(_email.text.trim(), _pwd.text);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        );
      }
    );
  }

  void resetPwd(){
    changePwd(context, email: _email);
  }

  Future<void> changePwd(BuildContext context, {@required TextEditingController email}) async{
    TextParagraphe title = TextParagraphe(
      "Mot de passe oubli??",
      color: AppColors.blackLightColor,
    );
    _email.clear();
    _pwd.clear();
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (ctx){
          return AlertDialog(
            title: title,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
            ),
            actions: [
              fieldMailButtonOk(ctx),
            ],
          );
        }
    );
  }

  Widget fieldMailButtonOk(BuildContext ctx){
    return Row(
      children: [
        ResponsiveWidget.isSmallScreen(context)
            ? Container(
          width: MediaQuery.of(context).size.width / 1.8,
          height: 42.0,
          child: TextField(
            controller: _email,
            cursorColor: AppColors.blackLightColor,
            decoration: InputDecoration(
              hintText: "Email",
              border: UnderlineInputBorder(borderSide: BorderSide.none)
            ),
          ),
        )
            : Container(
          width: 300,
          height: 42.0,
          child: TextField(
            controller: _email,
            cursorColor: AppColors.blackLightColor,
            decoration: InputDecoration(
              hintText: "Email",
              border: UnderlineInputBorder(borderSide: BorderSide.none)
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(FirebaseClass().changePassword(_email.text.trim().toLowerCase(), context)),
          child: new TextTitreBouton("OK", fontSize: 16,),
        )
      ],
    );
  }
}