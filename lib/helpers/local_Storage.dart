import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
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

  Future<void> storeBoolValue({required String key, required var object})async{
    await _sharedPreferences.setBool(key, object);
  }

  dynamic readBoolValue({required var object}){
    var value= _sharedPreferences.getBool(object);
    return value;
  }

  Future<void> storeIntValue({required String key, required var object})async{
    await _sharedPreferences.setInt(key, object);
  }

  dynamic readIntValue({required var object}){
    var value= _sharedPreferences.getInt(object);
    return value;
  }

  Future<void> storeDoubleValue({required String key, required var object})async{
    await _sharedPreferences.setDouble(key, object);
  }

  dynamic readDoubleValue({required var object}){
    var value= _sharedPreferences.getDouble(object);
    return value;
  }

  Future<void> deleteValue({required String key})async{
    try{
      await _sharedPreferences.remove(key);
    }catch(_){}
  }
}