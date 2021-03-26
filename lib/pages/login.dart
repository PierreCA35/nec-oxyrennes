
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/firebase/firestore.dart';
import 'package:new_explorer_challenge/library/widgets/text_paragraphe.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/library/widgets/toast.dart';
import 'package:new_explorer_challenge/model/responsive.dart';
import 'package:new_explorer_challenge/values/values.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
          child: Stack(
            children: [
              Positioned(
                top: 20.0,
                child: Center(
                  child: Container(
                    height: 180,
                    child: Image.asset(
                      "assets/joyride.png",
                      width: widthOfScreen,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: ListView(
                  children: [
                    _buildHeader(),
                    _buildForm(),
                  ],
                ),
              ),
            ],
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

  Widget _buildHeader() {
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

  Widget _buildForm() {
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
          //Mot de passe oublié
          ResponsiveWidget.isSmallScreen(context)
          ? Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
              child: GestureDetector(
                child: TextParagraphe(
                  "Mot de passe oublié ?",
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
                  "Mot de passe oublié ?",
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
      onPressed: null,
    );
  }

  Widget textInscription(MainAxisAlignment mainAxisAlignment){
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
            onTap: null,
          ),
        )
      ],
    );
  }

  connexion(){
    String mail = _email.text.trim();
    String pseudo = _pseudo.text.trim();
    String pwd = _pwd.text.trim();

    if(mail != ""){
      ToastMessage("Aucune adresse email renseigné");
    }
    if(pwd != ""){
      ToastMessage("Aucun mot de passe renseigné");
    }
  }

  void checkConnexion(){
    isConnecte(context);
  }

  void isConnecte(BuildContext context){
    Firebase().connectAccount(_email.text.trim(), _pwd.text.trim());
  }

  void resetPwd(){
    changePwd(context, email: _email);
  }

  Future<void> changePwd(BuildContext context, {@required TextEditingController email}) async{
    TextParagraphe title = TextParagraphe(
      "Mot de passe oublié",
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
            ResponsiveWidget.isSmallScreen(context)
            ? Container(
              width: MediaQuery.of(context).size.width / 1.8,
              height: 42.0,
              child: TextField(
                controller: _email,
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
                decoration: InputDecoration(
                    hintText: "Email",
                    border: UnderlineInputBorder(borderSide: BorderSide.none)
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(Firebase().changePassword(_email.text.trim().toLowerCase(), context)),
              child: new TextTitreBouton("OK"),
            )
          ],
        );
      }
    );
  }

  void _togglePwd(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}

