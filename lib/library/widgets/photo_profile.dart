
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/values/values.dart';

class ProfilPhoto extends InkWell{

  ProfilPhoto({
    double size,
    @required String urlImage,
    @required VoidCallback onPressed,
    Widget child,
  }):super(
    onTap: onPressed,
    child: CircleAvatar(
      child: child,
      radius: size,
      backgroundColor: AppColors.beigeColor,
      backgroundImage: (urlImage != "") ? CachedNetworkImageProvider(urlImage): null,
    ),
  );
}