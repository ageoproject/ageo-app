import 'package:get_storage/get_storage.dart';

class LocalStorage{
  final GetStorage _getStorage=GetStorage();

  LocalStorage._constructor();
  static final LocalStorage _instance=LocalStorage._constructor();
  factory LocalStorage(){
    return _instance;
  }

  Future<void> storeStringValue({required String key, required String value})async{
    await _getStorage.write(key, value);
  }

  String? readStringValue({required String key}){
    String? value=_getStorage.read(key);
    return value;
  }

  Future<void> storeObjectValue({required String key, required var object})async{
    await _getStorage.write(key, object);
  }

  dynamic readObjectValue({required var object}){
    var value= _getStorage.read(object);
    return value;
  }

  Future<void> deleteValue({required String key})async{
    try{
      await _getStorage.remove(key);
    }catch(_){}
  }
}