
class LanguageHelper {
  // this class content all supported language list and it's language code.
  final String languageKey="Language";
  final String englishLanguageCode="en";
  final String frenchLanguageCode="fr";
  final String spanishLanguageCode="es";
  final String portugueseLanguageCode="pt";

  List<String> get languageCodeList => [englishLanguageCode,frenchLanguageCode,spanishLanguageCode,portugueseLanguageCode];
  List<String> get languageNameList => ["English","Français","Espagnol","Portugais"];
  Map<String,String> get languageMap=>{
    "English": englishLanguageCode,
    "Français": frenchLanguageCode,
    "Espagnol": spanishLanguageCode,
    "Portugais": portugueseLanguageCode
  };
}