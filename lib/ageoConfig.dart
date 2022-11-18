import 'package:ageoClient/api.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AgeoConfig{
  late ApiClient _apiClient;
  late IndexApi _indexApi;
  late String _basePath;
  late String _appVersion;
  final String _frontendBasePath="https://ageo-web.web.app";

  String get frontendBasePath=>_frontendBasePath;
  String get appVersion=>_appVersion;
  String get versionText=>"v$appVersion   |   All rights reserved";

  AgeoConfig._constructor(){
    if(kReleaseMode){
      _basePath="https://ageo-web.herokuapp.com";
    }else{
      _basePath="https://ageo-web.herokuapp.com";
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

  Future<String?> reportEvent({required Event eventDetail})async{
    print("Reporting=> $eventDetail");
    Event? eventReportResponse= await _indexApi.reportEvent(eventDetail);
    // print(eventReportResponse);
    return eventReportResponse?.eventId;
  }

  Future<void> checkAppVersion()async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appVersion=packageInfo.version;
    // String appName = packageInfo.appName;
  }
}