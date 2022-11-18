import 'dart:io';
import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
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
  const HomePage({Key? key}) : super(key: key);
  // final MainController _mainController=Get.find();
  // final LanguageHelper _languageHelper=LanguageHelper();


  Future<bool> checkPermissions()async{
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
    if(await checkPermissions()){
      await Navigator.push(context, MaterialPageRoute(builder: (context)=>openPage));
    }else{
      bool permissionGranted = await showDialog(context: context, builder: (BuildContext context){
        return const DevicePermissionsHandler();
      });
      if(permissionGranted){
        // ignore: use_build_context_synchronously
        await Navigator.push(context, MaterialPageRoute(builder: (context)=> openPage));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
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
                          child: Row(
                            children: [
                              MaterialButton(
                                padding: EdgeInsets.zero,
                                onPressed: ()async{
                                  await reportEvent(openPage:const QuickReportEvent(), context: context);
                                  // await Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuickReportEvent()));
                                  Get.delete<ReportEventController>();
                                },
                                child: Image.asset("assets/images/home_page/circular_camera_ic.png",scale: 3,),
                              ),
                              const SizedBox(width: 16,),
                              Expanded(
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                      color: appTheme.primaryActionColor,
                                      boxShadow: [
                                      BoxShadow(
                                        offset:const Offset(0, 3),
                                        blurRadius: 6,
                                        color: appTheme.primaryActionColor.withOpacity(0.64)
                                      ),
                                    ],
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.transparent
                                    ),
                                    onPressed: ()async{
                                      reportEvent(openPage:const ReportEvent(), context: context);
                                    },
                                    child:const Text("home_page.monitor_event",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white),).tr(),
                                  ),
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
