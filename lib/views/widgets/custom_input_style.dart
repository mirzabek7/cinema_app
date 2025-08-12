import 'package:cinema_app/helpers/movie_icons.dart';
import 'package:cinema_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

InputDecoration CustomInputStyle(String hintText) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: CustomColors.inputColor),
    ),
    fillColor: CustomColors.inputColor,
    filled: true,
    enabled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: CustomColors.activeColor),
    ),
    suffixIcon: Padding(
      padding: EdgeInsets.only(right: 20),
      child: Icon(Movie.searchLeft, color: CustomColors.textColor, size: 22),
    ),
    hintText: hintText,
    hintStyle: TextStyle(
      color: CustomColors.textColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
  );
}
