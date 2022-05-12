import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rastreio/consts/app_colors.dart';

class AppFonts
{
  static TextStyle mainTitle = GoogleFonts.roboto(
    color: AppColors.primaryLightText,
    fontSize: 25,
    fontWeight: FontWeight.w600,
    letterSpacing: 1
  );

  static TextStyle subtitleLight = GoogleFonts.roboto(
    color: AppColors.secondaryLightText,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0
  );

   static TextStyle detailsInfo = GoogleFonts.roboto(
    color: AppColors.secondaryLightText,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0
  );

   static TextStyle textField = GoogleFonts.roboto(
     color: AppColors.primaryDarkText,
     fontWeight: FontWeight.w600
  );

  static TextStyle titleRegular = GoogleFonts.roboto(
    color: AppColors.primaryLightText,
    fontSize: 20,
    letterSpacing: 0,
    fontWeight: FontWeight.w400
  );

    static TextStyle smallTexts = GoogleFonts.roboto(
    color: AppColors.secondaryLightText,
  );

  static TextStyle cardMain = GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.primary
  );

   static TextStyle cardState = GoogleFonts.roboto(
    color: AppColors.primaryDarkText,
    fontSize: 17
  );

     static TextStyle cardStateSecondary = GoogleFonts.roboto(
    color: AppColors.secondary,
    fontSize: 15
  );

  static TextStyle secondaryColorTitle = GoogleFonts.roboto(
    fontSize: 20, 
    color: AppColors.secondary, 
    fontWeight: FontWeight.w600
  );

  static TextStyle dialogTitle = GoogleFonts.roboto(
    color: AppColors.primaryDarkText,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w700,
    fontSize: 28
  );

  static TextStyle dialogButton = GoogleFonts.roboto(
    fontSize: 20
  );

  

}