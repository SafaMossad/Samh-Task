import 'package:flutter/material.dart';
import 'package:samh_project/core/resources/resources.dart';

//for Theme
TextStyle _getTextStyle(double fontSize, FontWeight? fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: /*appContext?.locale.languageCode=="ar"? FontConstants.cairoFontFamily:*/
        FontFamilyManager.manropeFontFamily,
    color: color,
    fontWeight: fontWeight ?? FontWeightManager.medium,
  );
}

// regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle textFieldTextStyle({
  double fontSize = FontSize.s15,
  Color color = ColorManager.primary,
  FontWeight? fontWeight = FontWeightManager.bold,
}) {
  return _getTextStyle(
    fontSize,
    fontWeight,
    color,
  );
}
