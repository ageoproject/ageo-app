import 'package:get/get.dart';

class AppDrawerController extends GetxController{

  final RxString _activeButton="home".obs;

  RxString get activeButton => _activeButton;


  void changeActiveButton({required String value}){
    // this function used to change active button on app drawer
    _activeButton.value=value;
  }
}