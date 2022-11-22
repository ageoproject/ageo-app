import 'package:ageo/helpers/language_helper.dart';
import 'package:ageo/helpers/local_Storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final LanguageHelper _languageHelper=LanguageHelper();
  final LocalStorage _localStorage=LocalStorage();
  final RxBool _showSplashScreen=true.obs;
  final RxString _appLanguage ="English".obs;
  String? _appLanguageCode;
  final RxString _initialRoute="splash_screen".obs;

  RxBool get showSplashScreen=>_showSplashScreen;
  RxString get appLanguage=>_appLanguage;
  RxString get initialRoute=> _initialRoute;

  void initAppLanguage()async{
    _appLanguageCode=_localStorage.readStringValue(key: _languageHelper.languageKey);
    Map<String,String> reverseLanguageMap=_languageHelper.languageMap.map((key, value) => MapEntry(value, key));
    String? appLanguage = reverseLanguageMap[_appLanguageCode];
    if(appLanguage!=null){
      _appLanguage.value=appLanguage;
    }
    closeSplashScreen();
  }

  void closeSplashScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      _showSplashScreen.value=false;
    });
    setInitialRoute();
  }

  void setInitialRoute(){
    if(_appLanguageCode==null){
      _initialRoute.value="language_selection_screen";
    }else {
      _initialRoute.value="home_screen";
    }
  }

  void changeLanguage({required BuildContext context,required String language}){
    String? languageCode=_languageHelper.languageMap[language];
    if(languageCode!=null){
      _appLanguage.value=language;
      context.setLocale(Locale(languageCode));
      Get.updateLocale(Locale(languageCode));
    }
  }

  void changeAppLanguage({required BuildContext context,required String language})async{
    try{
      String? languageCode=_languageHelper.languageMap[language];
      if(languageCode!=null) {
        _appLanguage.value = language;
        _appLanguageCode = languageCode;
        context.setLocale(Locale(languageCode));
        Get.updateLocale(Locale(languageCode));
        _localStorage.storeStringValue(key: _languageHelper.languageKey, value: languageCode);
      }
    }catch(_){}
  }
}