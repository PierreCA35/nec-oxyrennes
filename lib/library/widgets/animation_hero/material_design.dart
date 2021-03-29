import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';

class MyScaffold extends Scaffold{

  final String titre;
  final Widget destination;

  MyScaffold({@required this.titre, @required this.destination}) :super(
    appBar: AppBar(title: TextTitreBouton(titre),),
    body: destination,
  );
}