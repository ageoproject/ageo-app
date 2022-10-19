
class LanguageHelper {

  final String languageKey="Language";
  final String englishLanguageCode="en";
  final String frenchLanguageCode="fr";
  final String spanishLanguageCode="es";
  final String portugueseLanguageCode="pt";

  List<String> get languageCodeList => [englishLanguageCode,frenchLanguageCode,spanishLanguageCode,portugueseLanguageCode];
  List<String> get languageNameList => ["English","French","Spanish","Portuguese"];
  Map<String,String> get languageMap=>{
    "English": englishLanguageCode,
    "French": frenchLanguageCode,
    "Spanish": spanishLanguageCode,
    "Portuguese": portugueseLanguageCode
  };
}