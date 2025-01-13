import 'package:flutter/material.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';


BoxDecoration containerStyle() {
  return BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: Colors.black.withOpacity(0.3), width: 0.5),
    boxShadow: [
      BoxShadow(
        blurRadius: 8,
        offset: const Offset(2, 2),
        color: Colors.black.withOpacity(0.2)
      )
    ]
  );
}


class CustomTextStyles{
  TextStyle  TitleTextStyle(double fontSize) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }
  
  TextStyle ProfileTextStyle(double fontSize){
    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.grey
    );
  }
}