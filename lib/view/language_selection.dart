import 'dart:io';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/language_helper.dart';
import 'package:ageo/controllers/main_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelection extends StatelessWidget {
  LanguageSelection({Key? key}) : super(key: key);
  final double _ageoLogoWidth=265;
  final LanguageHelper _languageHelper=LanguageHelper();
  final MainController _mainController=Get.find();
  late String _appLanguage;

  @override
  Widget build(BuildContext context) {
    final CustomThemeData appTheme=Theme.of(context).customTheme;
    _appLanguage=_mainController.appLanguage.value;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height/3.5,
            left: (MediaQuery.of(context).size.width/2)-_ageoLogoWidth/2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/splash_screen/ageo_logo.png",width: _ageoLogoWidth,),

                Padding(
                  padding: const EdgeInsets.only(top: 85,bottom: 25),
                  child: Text("common_key.select_preferred_language",style: TextStyle(color: appTheme.primaryTextColor,fontSize: 16,),).tr(),
                ),
                Container(
                  decoration:BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: appTheme.inputFieldsBorderColor),
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      value: _mainController.appLanguage.value,
                      underline:const SizedBox(),
                      // isExpanded: true,
                      items: _languageHelper.languageNameList.map((String value) {
                        return DropdownMenuItem<String>(
                          key: Key(value),
                          value: value,
                          //child: new Text(value),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text(value,style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,)),
                          ),
                        );
                      }).toList(),
                      onChanged: (language) {
                        if(language!=null) {
                          _appLanguage = language;
                          _mainController.changeLanguage(language: language,context: context);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color:appTheme.primaryActionColor,
        // padding: EdgeInsets.only(bottom: 14),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: appTheme.primaryActionColor,
          ),
          onPressed: (){
            _mainController.changeAppLanguage(language: _appLanguage,context: context);
            _mainController.setInitialRoute();
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: Platform.isIOS?8.0:0),
            child: const Text("common_key.next_btn",style: TextStyle(color: Colors.white,fontSize: 16),).tr(),
          ),
        ),
      ),
    );
  }
}
