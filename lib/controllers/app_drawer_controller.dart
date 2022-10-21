import 'package:get/get.dart';

class AppDrawerController extends GetxController{

  final RxString _activeButton="home".obs;

  RxString get activeButton => _activeButton;


  void changeActiveButton({required String value}){
    _activeButton.value=value;
  }
}