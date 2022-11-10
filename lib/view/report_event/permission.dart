import 'dart:io';
import 'dart:ui';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/locationHelper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class DevicePermissionsHandler extends StatelessWidget {
  const DevicePermissionsHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Container(
      color: Colors.white.withOpacity(0.7),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      // child: Text("Close",style: TextStyle(fontSize: 16,color: appTheme.primaryTextColor),),
                      child: Icon(Icons.close,color: appTheme.primaryTextColor,size: 36,),
                      onPressed: (){
                        Navigator.pop(context,false);
                      },
                    )
                  ),
                  Padding(
                    padding:const EdgeInsets.only(top: 60,bottom: 90),
                    child: RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${"permission_page.ok".tr()}\n",
                              style: TextStyle(color: appTheme.primaryActionColor,fontWeight: FontWeight.w600,fontSize: 22),
                            ),
                            TextSpan(
                              text: "permission_page.we_need_some_access".tr(),
                              style: TextStyle(color: appTheme.primaryActionColor,fontWeight: FontWeight.w900,fontSize: 22),
                            ),

                          ]
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/report_event/location_ic.png",color: appTheme.iconColor,width: 25,),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            // child: Text("Location",style: TextStyle(color: appTheme.iconColor,fontSize: 16,fontWeight: FontWeight.w900),),
                            child: RichText(
                              textScaleFactor: MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${"permission_page.permission_type.location".tr()}\n",
                                      style: TextStyle(color: appTheme.iconColor,fontSize: 16,fontWeight: FontWeight.w900),
                                    ),
                                    TextSpan(
                                      text: "permission_page.permission_type.location_description".tr(),
                                      style: TextStyle(color: appTheme.iconColor,fontSize: 16,fontWeight: FontWeight.w600),
                                    ),
                                  ]
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: (MediaQuery.of(context).size.width)/2-50),
                        child: Divider(color: appTheme.inputFieldsBorderColor,),
                      ),
                      SizedBox(
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/report_event/camera_ic.png",color: appTheme.iconColor,width: 27,),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              // child: Text("Camera",style: TextStyle(color: appTheme.iconColor,fontSize: 16,fontWeight: FontWeight.w900),),
                              child: RichText(
                                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${"permission_page.permission_type.camera".tr()}\n",
                                        style: TextStyle(color: appTheme.iconColor,fontSize: 16,fontWeight: FontWeight.w900),
                                      ),
                                      TextSpan(
                                        text: "permission_page.permission_type.camera_description".tr(),
                                        style: TextStyle(color: appTheme.iconColor,fontSize: 16,fontWeight: FontWeight.w600),
                                      ),
                                    ]
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: (MediaQuery.of(context).size.width)/2-50),
                        child: Divider(color: appTheme.inputFieldsBorderColor,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/report_event/media_ic.png",color: appTheme.iconColor,width: 27,),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            // child: Text("Media",style: TextStyle(color: appTheme.iconColor,fontSize: 16,fontWeight: FontWeight.w900),),
                            child: RichText(
                              textScaleFactor: MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${"permission_page.permission_type.media".tr()}\n",
                                      style: TextStyle(color: appTheme.iconColor,fontSize: 16,fontWeight: FontWeight.w900),
                                    ),
                                    TextSpan(
                                      text: "permission_page.permission_type.media_description".tr(),
                                      style: TextStyle(color: appTheme.iconColor,fontSize: 16,fontWeight: FontWeight.w600),
                                    ),
                                  ]
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),

            SliverFillRemaining(
              fillOverscroll: false,
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        boxShadow:[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset:const Offset(0, -2),
                              blurRadius: 6
                          )
                        ]
                    ),
                    child: TextButton(
                      child: Text("permission_page.allow_button",style: TextStyle(color: appTheme.primaryActionColor,fontWeight: FontWeight.w400,fontSize: 16),).tr(),
                      onPressed: ()async{
                        LocationHelper locationHelper=LocationHelper();
                        Map<Permission, PermissionStatus> statuses = await [
                          Permission.location,
                          Permission.camera,
                          Permission.photos,
                        ].request();
                        if(Platform.isAndroid){
                          if(statuses[Permission.location] == PermissionStatus.granted && statuses[Permission.camera] == PermissionStatus.granted){
                            Navigator.pop(context,true);
                          }else if(statuses[Permission.location] == PermissionStatus.permanentlyDenied || statuses[Permission.camera] == PermissionStatus.permanentlyDenied){
                            locationHelper.showLocationPermissionError(context: context, errorMessage: tr("permission_page.permission_denied_permanently"), actionType: "permission_denied_permanently");
                            // openAppSettings();
                          }
                        }else{
                          if(statuses[Permission.location] == PermissionStatus.granted && statuses[Permission.camera] == PermissionStatus.granted && statuses[Permission.photos] == PermissionStatus.granted){
                            Navigator.pop(context,true);
                          }else if(statuses[Permission.location] == PermissionStatus.permanentlyDenied || statuses[Permission.camera] == PermissionStatus.permanentlyDenied || statuses[Permission.photos] == PermissionStatus.permanentlyDenied){
                            // openAppSettings();
                            locationHelper.showLocationPermissionError(context: context, errorMessage: tr("permission_page.permission_denied_permanently"), actionType: "permission_denied_permanently");
                          }
                        }

                        // print(statuses[Permission.location]);
                        // print(statuses[Permission.camera]);
                        // print(statuses[Permission.photos]);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
