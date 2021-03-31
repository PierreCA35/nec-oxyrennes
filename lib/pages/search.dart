import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/card_evenement.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/values/values.dart';

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.blackLightColor,
        centerTitle: true,
        title: Container(
            height: 100,
            width: 100,
            child: Image.asset("assets/logo_NEC_.png")),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: TextTitreBouton(
                    'Nos évènements !',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 80, left: 30, right: 30),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index){
                     return CardEvenement();
                    },
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
