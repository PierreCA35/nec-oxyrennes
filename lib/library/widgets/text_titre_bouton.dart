
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTitreBouton extends Text{

  TextTitreBouton(data, {
    TextAlign textAlign : TextAlign.center,
    double fontSize: 17.0,
    FontStyle fontStyle: FontStyle.normal,
    color: Colors.black,
    String fontFamily,
    FontWeight fontWeight,
  }):super(
      data,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        fontSize: fontSize,
        fontStyle: fontStyle,
        color: color,
        fontWeight: fontWeight,
      )
  );
}
