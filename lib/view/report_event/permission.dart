import 'dart:io';
import 'dart:ui';
import 'package:ageo/helpers/app_theme.dart';
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
                              text: "OK!\n",
                              style: TextStyle(color: appTheme.primaryActionColor,fontWeight: FontWeight.w600,fontSize: 22),
                            ),
                            TextSpan(
                              text: "We need some access!",
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
                                      text: "Location\n",
                                      style: TextStyle(color: appTheme.iconColor,fontSize: 16,fontWeight: FontWeight.w900),
                                    ),
                                    TextSpan(
                                      text: "Need location access to\ncapture event location",
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
                      Row(
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
                                      text: "Camera\n",
                                      style: TextStyle(color: appTheme.iconColor,fontSize: 16,fontWeight: FontWeight.w900),
                                    ),
                                    TextSpan(
                                      text: "Need camera access to\ncapture event photo's",
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
                                      text: "Media\n",
                                      style: TextStyle(color: appTheme.iconColor,fontSize: 16,fontWeight: FontWeight.w900),
                                    ),
                                    TextSpan(
                                      text: "Need media access to\nupload event photo's\nfrom gallery",
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
                      child: Text("Allow permissions",style: TextStyle(color: appTheme.primaryActionColor,fontWeight: FontWeight.w400,fontSize: 16),),
                      onPressed: ()async{
                        if(Platform.isAndroid){
                          Map<Permission, PermissionStatus> statuses = await [
                            Permission.location,
                          ].request();
                          if(statuses[Permission.location] == PermissionStatus.granted){
                            Navigator.pop(context,true);
                          }
                        }else{
                          Map<Permission, PermissionStatus> statuses = await [
                            Permission.location,
                            Permission.camera,
                            Permission.photos,
                          ].request();
                          if(statuses[Permission.location] == PermissionStatus.granted && statuses[Permission.camera] == PermissionStatus.granted && statuses[Permission.photos] == PermissionStatus.granted){
                            Navigator.pop(context,true);
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
