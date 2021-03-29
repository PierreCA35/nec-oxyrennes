import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/animation_hero/material_design.dart';

class Datas{

  pusher(BuildContext context, String titre, Widget destination){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return MyScaffold(titre: titre, destination: destination,);
    }));
  }
}