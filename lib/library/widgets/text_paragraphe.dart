
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextParagraphe extends Text{

  TextParagraphe(data, {
    TextAlign textAlign : TextAlign.center,
    double fontSize: 17.0,
    FontStyle fontStyle: FontStyle.normal,
    color: Colors.black,
    String fontFamily,
    FontWeight fontWeight,
  }):super(
    data,
    textAlign: textAlign,
    style: GoogleFonts.roboto(
      fontSize: fontSize,
      fontStyle: fontStyle,
      color: color,
      fontWeight: fontWeight
    )
  );
}
