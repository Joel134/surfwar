import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scapple_notes_app/styles/colors.dart';

class AppFonts {
  static TextStyle getAppFont(
      {FontWeight? fontWeight, Color? color, double? fontSize}) {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ));
  }

  static final primaryText = getAppFont(color: TextColor.primary, fontSize: 24);
  static final secondaryText =
      getAppFont(color: TextColor.secondary, fontSize: 24);
  static final hintText = getAppFont(color: TextColor.secondary, fontSize: 14);
}
