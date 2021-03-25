import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/values/values.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var marginBetweenImages = Sizes.MARGIN_16 * 2;
    var marginAroundEntireScreen = Sizes.MARGIN_16 * 2;
    var widthOfScreen = MediaQuery.of(context).size.width;
    var widthOfSmallImage =
        (widthOfScreen - (marginAroundEntireScreen + marginBetweenImages)) / 3;
    var widthOfLargeImage = (widthOfSmallImage * 2) + 16;

    return Scaffold(
    );
  }
}