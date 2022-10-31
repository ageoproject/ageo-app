import 'package:ageoClient/api.dart';
import 'package:get/get.dart';

class ReportEventController extends GetxController{

  final RxString _activeTab="event_type".obs;
  EventEventTypeEnum? _selectedEventType;

  RxString get activeTab=> _activeTab;
  EventEventTypeEnum? get selectedEventType=>_selectedEventType;

  void changeActiveTab({required String value}){
    _activeTab.value=value;
  }

  void changeSelectedEventType({required EventEventTypeEnum value }){
    _selectedEventType=value;
    print(_selectedEventType);
    // update();
  }
}