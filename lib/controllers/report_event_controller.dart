
import 'package:get/get.dart';

class ReportEventController extends GetxController{

  final RxString _activeTab="select_event".obs;

  RxString get activeTab=> _activeTab;

  void changeActiveTab({required String value}){
    _activeTab.value=value;
  }

}