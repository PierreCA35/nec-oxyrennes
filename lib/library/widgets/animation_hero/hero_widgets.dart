import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget{

  final String url;
  HeroWidget(this.url);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: url,
      child:Image.network(url, fit: BoxFit.cover,),
    );
  }
}