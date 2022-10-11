import 'package:ageoClient/api.dart';
import 'package:flutter/foundation.dart';

class AgeoConfig{
  late ApiClient _apiClient;
  late IndexApi _indexApi;
  late String _basePath;

  AgeoConfig._constructor(){
    if(kReleaseMode){
      _basePath="http://192.168.1.20:3000";
    }else{
      _basePath="http://192.168.1.20:3000";
    }
    _apiClient=ApiClient(basePath: _basePath);
    _indexApi=IndexApi(_apiClient);
  }

  //creating single copy of class
  static final AgeoConfig _instance = AgeoConfig._constructor();

  //factory will return class instance and if not initialized then it first initialize and then return instance
  factory AgeoConfig() {
    return _instance;
  }

  Future<String?> reportEvent()async{
    Event event=Event(
      eventType: EventEventTypeEnum.EARTHQUAKE,
      time: DateTime.now().toString(),
      image: ["location/test/image.png"],
      comment: "The is a test comment",
      location: [12323.233,123.123],
      city: "Mumbai",
      state: "Maharashtra",
      country: "India",
      eventDetails: '{"name":"FLOODED"}'
    );
    EventReportResponse? eventReportResponse= await _indexApi.reportEvents(event);
    return eventReportResponse?.eventId;
  }

}