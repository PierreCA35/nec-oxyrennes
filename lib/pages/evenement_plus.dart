
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/text_paragraphe.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/pages/inscription_evenement.dart';
import 'package:new_explorer_challenge/values/values.dart';

class EvenementPlus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: TextTitreBouton(
                    "Challenge Réflexion",
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextParagraphe(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                    "when an unknown printer took a galley of type and scrambled it to make a type"
                    " specimen book. It has survived not only five centuries, but also the leap into "
                    "electronic typesetting, remaining essentially unchanged.",
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/mountain.png"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.blackLightColor),
                      ),
                      child: TextTitreBouton(
                        "Inscription",
                        color: AppColors.greyLightColor,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => InscriptionEvenement()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
