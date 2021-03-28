
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/values/values.dart';

class TopMenu{

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