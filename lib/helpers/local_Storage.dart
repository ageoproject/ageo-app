import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
  // this class allow to store and read data on user device local storage.
  late final SharedPreferences _sharedPreferences;

  LocalStorage._constructor();
  static final LocalStorage _instance=LocalStorage._constructor();
  factory LocalStorage(){
    return _instance;
  }

  SharedPreferences get sharedPreferences => _sharedPreferences;

  void initSharedPreferences({required SharedPreferences sharedPreferences}){
    _sharedPreferences = sharedPreferences;
  }

  Future<void> storeStringValue({required String key, required String value})async{
    await _sharedPreferences.setString(key, value);
  }

  String? readStringValue({required String key}){
    String? value=_sharedPreferences.getString(key);
    return value;
  }

  Future<void> storeBoolValue({required String key, required bool value})async{
    await _sharedPreferences.setBool(key, value);
  }

  bool? readBoolValue({required String key}){
    var value= _sharedPreferences.getBool(key);
    return value;
  }

  Future<void> storeIntValue({required String key, required int value})async{
    await _sharedPreferences.setInt(key, value);
  }

  dynamic readIntValue({required String key}){
    var value= _sharedPreferences.getInt(key);
    return value;
  }

  Future<void> storeDoubleValue({required String key, required double value})async{
    await _sharedPreferences.setDouble(key, value);
  }

  dynamic readDoubleValue({required String key}){
    var value= _sharedPreferences.getDouble(key);
    return value;
  }

  Future<void> deleteValue({required String key})async{
    try{
      await _sharedPreferences.remove(key);
    }catch(_){}
  }
}