import 'package:ageo/helpers/app_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomThemeData _appTheme=Theme.of(context).customTheme;
    return Scaffold(
      body: Container(),
    );
  }
}
