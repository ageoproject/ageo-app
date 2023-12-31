import 'dart:io';
import 'dart:ui';
import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/local_Storage.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:ageo/view/report_event/permission.dart';
import 'package:ageo/view/report_event/quick_report_event.dart';
import 'package:ageo/view/report_event/report_event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  // final MainController _mainController=Get.find();
  // final LanguageHelper _languageHelper=LanguageHelper();
  final LocalStorage _localStorage=LocalStorage();
  late CustomThemeData appTheme;


  Future<bool> checkPermissions()async{
    // this function will check whether user has provided appropriate permission like camera location and gallery before proceeding further
    LocationPermission locationPermission= await Geolocator.checkPermission();
    PermissionStatus cameraPermission = await Permission.camera.status;
      if(locationPermission ==LocationPermission.denied || locationPermission ==LocationPermission.deniedForever || cameraPermission.isDenied || cameraPermission.isPermanentlyDenied){
        return false;
      }else {
        if (Platform.isIOS) {
          PermissionStatus photosPermission = await Permission.photos.status;
          if (photosPermission.isDenied || photosPermission.isPermanentlyDenied) {
            return false;
          }
        }
        return true;
      }
  }

  Future<void> reportEvent({required Widget openPage,required BuildContext context})async{
    // this function check all pre-requisite before allowing user to report event
    if(await _dataCollectionConcent(context: context)){
      if (await checkPermissions()) {
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => openPage));
      } else {
        // if this is user's first time or user has not provided some access the this will open permission bottomSheet
        bool permissionGranted = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return const DevicePermissionsHandler();
            });
        if (permissionGranted) {
          // ignore: use_build_context_synchronously
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => openPage));
        }
      }
    }
  }

  Future<bool> _dataCollectionConcent({required BuildContext context})async{
    // this function check whether user has given their concent for data collection like sensor data and image. And if not it shows popup and ask their concent and
    // if user agree then only allowed to report event.
    bool userConcent=_localStorage.readBoolValue(key: "DataCollectionConcent")??false;
    if(!userConcent){
      userConcent =await showDialog(context: context, barrierDismissible: false, builder: (BuildContext context){
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("home_page.concent_title",style: TextStyle(fontSize: 16,color: appTheme.primaryTextColor,fontWeight: FontWeight.w600),textAlign: TextAlign.center,).tr(),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text("home_page.concent_text",style: TextStyle(fontSize: 12,color: appTheme.primaryTextColor,fontWeight: FontWeight.w400),textAlign: TextAlign.center,).tr(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: TextButton.styleFrom(
                                backgroundColor: appTheme.declineActionColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: (){
                                Navigator.pop(context,false);
                              },
                              child:const Text("home_page.cancel",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),).tr(),
                            ),
                            const SizedBox(width: 18,),
                            ElevatedButton(
                              style: TextButton.styleFrom(
                                backgroundColor: appTheme.primaryActionColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: (){
                                Navigator.pop(context,true);
                              },
                              child: const Text("home_page.confirm",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),).tr(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      })??false;
      await _localStorage.storeBoolValue(key: "DataCollectionConcent", value: userConcent);
    }
    return userConcent;
  }

  @override
  Widget build(BuildContext context) {
    appTheme=Theme.of(context).customTheme;
    bool isMobile=MediaQuery.of(context).size.shortestSide<600;
    double buttonWidth=isMobile?MediaQuery.of(context).size.width:(MediaQuery.of(context).size.width)/2;
    return Scaffold(
      drawer: CustomAppDrawer(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.12,
            child: Image.asset("assets/images/splash_screen/splash_screen_bg.png",width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
          ),

          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    // padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height/3.5)-120,),
                    padding: EdgeInsets.zero,
                    child: Image.asset("assets/images/splash_screen/ageo_logo.png",width: 265,),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).orientation == Orientation.portrait?(MediaQuery.of(context).size.height/3.5)-120:50),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 48,
                                width: buttonWidth,
                                child: OutlinedButton(
                                  onPressed: ()async{
                                    await reportEvent(openPage:const QuickReportEvent(), context: context);
                                    // await Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuickReportEvent()));
                                    Get.delete<ReportEventController>();
                                  },
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape:RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    side: BorderSide(color: appTheme.primaryActionColor,width: 1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset("assets/images/report_event/camera_ic.png",scale: 3.5,color:appTheme.primaryActionColor),
                                      const SizedBox(width: 16,),
                                      Flexible(fit: FlexFit.loose,child: Text("home_page.quick_monitor_event",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:appTheme.primaryActionColor),).tr(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16,),
                              Container(
                                height: 48,
                                width: buttonWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                    color: appTheme.primaryActionColor,
                                    boxShadow: [
                                    BoxShadow(
                                      offset:const Offset(0, 3),
                                      blurRadius: 6,
                                      color: appTheme.primaryActionColor.withOpacity(0.16)
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                  ),
                                  onPressed: ()async{
                                    reportEvent(openPage:const ReportEvent(), context: context);
                                  },
                                  child:const Text("home_page.monitor_event",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white),).tr(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 30),
                          child: Text("home_page.description_txt",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: appTheme.placeHolderTextColor),).tr(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          CustomAppBar(),
        ],
      ),
    );
  }
}
