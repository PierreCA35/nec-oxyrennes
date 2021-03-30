import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/animation_hero/hero_widgets.dart';
import 'package:new_explorer_challenge/library/widgets/text_paragraphe.dart';
import 'package:new_explorer_challenge/model/carnet_de_bord.dart';
import 'package:new_explorer_challenge/model/home.dart';
import 'package:new_explorer_challenge/values/values.dart';

import '../text_titre_bouton.dart';

class HeroDetail extends StatelessWidget{

  final HeroWidget hero;
  final CarnetDeBord carnetDeBord;

  HeroDetail(this.carnetDeBord, this.hero);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        hero,
        Padding(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: TextParagraphe(
            carnetDeBord.description,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class HeroDetailHomeBord extends StatelessWidget{

  final HeroWidget hero;
  final Home homeBorde;

  HeroDetailHomeBord(this.homeBorde, this.hero);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        hero,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Chip(
                label: TextTitreBouton(
                    homeBorde.tag1
                ),
                backgroundColor: AppColors.beigeColor,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: TextParagraphe(
            homeBorde.description,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0, right: 10.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: TextParagraphe(
              "écrit par ${homeBorde.auteur}"
            ),
          ),
        )
      ],
    );
  }
}