import 'package:ageo/helpers/language_helper.dart';
import 'package:ageo/helpers/local_Storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final LanguageHelper _languageHelper=LanguageHelper();
  final LocalStorage _localStorage=LocalStorage();
  final RxString _appLanguage ="English".obs;
  final _appLanguageCode=Rxn<String>();
  final RxString _initialRoute="splash_screen".obs;

  RxString get appLanguage=>_appLanguage;
  RxString get initialRoute=> _initialRoute;

  void initAppLanguage(){
    _appLanguageCode.value=_localStorage.readStringValue(key: _languageHelper.languageKey);
    Map<String,String> reverseLanguageMap=_languageHelper.languageMap.map((key, value) => MapEntry(value, key));
    String? appLanguage = reverseLanguageMap[_appLanguageCode];
    if(appLanguage!=null){
      _appLanguage.value=appLanguage;
    }
  }

  void setInitialRoute(){
    if(_appLanguageCode==null){
      _initialRoute.value="language_selection_screen";
    }else {
      _initialRoute.value="home_screen";
    }
  }

  void changeAppLanguage({required BuildContext context,required String language}){
    String? languageCode=_languageHelper.languageMap[language];
    if(languageCode!=null){
      _appLanguage.value=language;
      _appLanguageCode.value=languageCode;
      context.setLocale(Locale(languageCode));
      _localStorage.storeStringValue(key: _languageHelper.languageKey, value: languageCode);
    }
  }
}