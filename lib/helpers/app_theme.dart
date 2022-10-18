import 'package:flutter/material.dart';


class CustomThemeData{
  late final Color primaryActionColor;
  late final Color approvedActionColor;
  late final Color declineActionColor;
  late final Color primaryTextColor;
  late final Color placeHolderTextColor;
  late final Color toggleSelectionColor;
  late final Color iconColor;
  late final Color inputFieldsBorderColor;
  
  CustomThemeData({
    required this.primaryActionColor,
    required this.approvedActionColor,
    required this.declineActionColor,
    required this.primaryTextColor,
    required this.placeHolderTextColor,
    required this.toggleSelectionColor,
    required this.iconColor,
    required this.inputFieldsBorderColor,

  });
}

extension CustomTheme on ThemeData{
  //CustomThemeDate get customTheme=>brightness==Brightness.light? _customLightTheme : _customDarkTheme;
  CustomThemeData get customTheme=>_customLightTheme;
}

final _customLightTheme=CustomThemeData(
  primaryActionColor:const Color(0xff105268),
  approvedActionColor: const Color(0xff7AD559),
  declineActionColor: const Color(0xffE27059),
  primaryTextColor: const Color(0xff18050D),
  placeHolderTextColor: const Color(0xffA9A1A4),
  toggleSelectionColor: const Color(0xffAEC5EB),
  iconColor: const Color(0xff646061),
  inputFieldsBorderColor: const Color(0xffD9D9D9),
);