
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonText extends Text{

  MonText(data, {
    TextAlign textAlign : TextAlign.center,
    double fontSize: 17.0,
    FontStyle fontStyle: FontStyle.normal,
    color: Colors.black,
    String fontFamily,
  }):super(
    data,
    textAlign: textAlign,
    style: GoogleFonts.arimo(
      fontSize: fontSize,
      fontStyle: fontStyle,
      color: color
    )
  );
}
