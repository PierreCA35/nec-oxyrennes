
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/model/responsive.dart';
import 'package:new_explorer_challenge/values/values.dart';

class InscriptionEvenement extends StatefulWidget {
  @override
  _InscriptionEvenementState createState() => _InscriptionEvenementState();
}

class _InscriptionEvenementState extends State<InscriptionEvenement> {

  TextEditingController _nomPrenom;
  TextEditingController _email;
  TextEditingController _telephone;

  @override
  void initState() {
    _nomPrenom = TextEditingController();
    _email = TextEditingController();
    _telephone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nomPrenom.dispose();
    _email.dispose();
    _telephone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.blackLightColor,
        title: Container(
          height: 100,
          width: 100,
          child: Image.asset("assets/logo_NEC_.png"),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15.0, bottom: 10.0, top: 10.0),
            width: 30,
            height: 30,
            child: FloatingActionButton(
              child: Icon(Icons.clear, color: AppColors.blackLightColor,),
              backgroundColor: AppColors.beigeColor,
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ),
        ],
      ),
      body: Container(
        color: AppColors.beigeColor,
        width: MediaQuery.of(context).size.height / 1.20,
        child: bodyInscription(widthOfScreen),
      ),
    );
  }

  Widget bodyInscription(double width){
    return Stack(
      children: [
        Positioned(
          top: 20.0,
          child: Center(
            child: Container(
              height: 180,
              child: Image.asset(
                "assets/youpi.png",
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
        margin: EdgeInsets.only(top: 215, left: 40, right: 20),
        child: TextTitreBouton(
          "Plein de surprises pour vous !",
          textAlign: TextAlign.left,
          fontSize: 25,
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
              ? nomPrenom(null)
              : Center(child: nomPrenom(300.0),),
          //Champ Email
          ResponsiveWidget.isSmallScreen(context)
              ? email(null)
              : Center(child: email(300.0)),
          //Champ Mot de passe
          ResponsiveWidget.isSmallScreen(context)
              ? telephone(null)
              : Center(child: telephone(300.0)),
          //Bouton Connexion
          ResponsiveWidget.isSmallScreen(context)
              ? Align(
            alignment: Alignment.centerLeft,
            child: boutonInscription(),
          )
              : Center(child: boutonInscription(),),
        ],
      ),
    );
  }

  Widget nomPrenom(double width){
    return Container(
      width: width,
      margin: EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
          color: AppColors.greyLightColor,
          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextField(
          controller: _nomPrenom,
          cursorColor: AppColors.blackLightColor,
          decoration: InputDecoration(
            hintText: "Mot de passe",
            border: UnderlineInputBorder(
                borderSide: BorderSide.none
            ),
          ),
        ),
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

  Widget telephone(double width){
    return Container(
      width: width,
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
          color: AppColors.greyLightColor,
          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextField(
          controller: _telephone,
          keyboardType: TextInputType.phone,
          cursorColor: AppColors.blackLightColor,
          decoration: InputDecoration(
              hintText: "Téléphone",
              border: UnderlineInputBorder(borderSide: BorderSide.none),
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
      onPressed: () => Navigator.pop(context),
    );
  }
}
