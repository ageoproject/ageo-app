import 'dart:convert';
import 'package:ageoClient/api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;

// AgeoConfig is singleton class
class AgeoConfig{
  late ApiClient _apiClient;
  late IndexApi _indexApi;
  late String _basePath;
  late String _appVersion;
  late String _frontendBasePath;

  String get frontendBasePath=>_frontendBasePath;
  String get appVersion=>_appVersion;
  String get versionText=>"v$appVersion   |   ${tr("app_drawer.all_rights_reserved")}";

  AgeoConfig._constructor(){
    // this constructor select correct basePath for debug and production env base on app build type
    if(kReleaseMode){
      _basePath="https://ageoplatform.eu/api";
      _frontendBasePath="https://ageoplatform.eu";
    }else{
      // _basePath="https://api.staging.ageo.blackcurrantapps.com/api";
      // _frontendBasePath="https://ageo-web.web.app";
      _basePath="https://ageoplatform.eu/api";
      _frontendBasePath="https://ageoplatform.eu";
      // _basePath="http://192.168.1.17:3000/api";
      // _basePath="https://8cd7-110-226-182-4.in.ngrok.io";
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

  Future<String?> reportEvent({required Event eventDetail,required List<String> imagePathList})async{
    // this function call backend Api to submit user report event
    if (kDebugMode) {
      print("Reporting=> $eventDetail");
    }
    Event? eventReportResponse= await _indexApi.reportEvent(
      eventDetail.eventType.toString(),
      eventDetail.time.toString(),
      json.encode(eventDetail.location),
      quickReport: eventDetail.quickReport,
      comment: eventDetail.comment.toString(),
      sensorData: json.encode(eventDetail.sensorData),
      commonEventDetails: json.encode(eventDetail.commonEventDetails),
      customEventDetails: json.encode(eventDetail.customEventDetails),
      image1: imagePathList.isNotEmpty?await http.MultipartFile.fromPath("image1",imagePathList[0]):null,
      image2: imagePathList.length>=2?await http.MultipartFile.fromPath("image2",imagePathList[1]):null,
      image3: imagePathList.length>=3?await http.MultipartFile.fromPath("image3",imagePathList[2]):null,
    );
    // print(eventReportResponse);
    return eventReportResponse?.eventId;
    // return null;
  }

  Future<void> checkAppVersion()async {
    // this function read pubspec.yaml file and check app version
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appVersion=packageInfo.version;
    // String appName = packageInfo.appName;
  }
}