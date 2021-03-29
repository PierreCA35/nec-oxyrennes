import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/animation_hero/hero_widgets.dart';
import 'package:new_explorer_challenge/library/widgets/text_paragraphe.dart';
import 'package:new_explorer_challenge/model/carnet_de_bord.dart';

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