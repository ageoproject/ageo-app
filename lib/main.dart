import 'package:ageo/ageoConfig.dart';
import 'package:ageo/helpers/language_helper.dart';
import 'package:ageo/helpers/local_Storage.dart';
import 'package:ageo/controllers/main_controller.dart';
import 'package:ageo/view/home_page.dart';
import 'package:ageo/view/language_selection.dart';
import 'package:ageo/view/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  LocalStorage localStorage=LocalStorage();
  LanguageHelper languageHelper=LanguageHelper();
  final AgeoConfig ageoConfig = AgeoConfig();
  await ageoConfig.checkAppVersion();
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  localStorage.initSharedPreferences(sharedPreferences: sharedPreferences);
  // await localStorage.deleteValue(key: languageHelper.languageKey);
  String? languageCode=localStorage.readStringValue(key: languageHelper.languageKey); // to check if user has selected any preferred language or not.
  Locale defaultLanguage=Locale(languageHelper.englishLanguageCode,);// it will select default language to english
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // this function set status bar color
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    EasyLocalization(
      // this is list of all supported language
      supportedLocales: [Locale(languageHelper.englishLanguageCode),Locale(languageHelper.frenchLanguageCode),Locale(languageHelper.portugueseLanguageCode),Locale(languageHelper.spanishLanguageCode)],
      path: "assets/translations",  // this is location where all localization file are store
      fallbackLocale: languageCode != null ? languageHelper.languageCodeList.contains(languageCode) ? Locale(languageCode) : defaultLanguage : defaultLanguage, // this is to set initial language when app opens
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final MainController _mainController=Get.put(MainController());

  Widget screenSelector({required String route}){
    //  This function select screen when app open
    if(route=="home_screen"){
      return HomePage();
    }else{
      return LanguageSelection();
    }
  }

  @override
  Widget build(BuildContext context) {
    _mainController.initAppLanguage();
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      darkTheme: ThemeData(
        fontFamily: "WorkSans",
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: "WorkSans",
        brightness: Brightness.light,
      ),
      // Obx is observer widget and listen to any changes in showSplashScreen variable
      home: Obx(() => _mainController.showSplashScreen.value?const SplashScreen() : screenSelector(route: _mainController.initialRoute.value)),
    );
  }
}
