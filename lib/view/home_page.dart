import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/language_helper.dart';
import 'package:ageo/controllers/main_controller.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:ageo/view/report_event/permission.dart';
import 'package:ageo/view/report_event/report_event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final MainController _mainController=Get.find();
  final LanguageHelper _languageHelper=LanguageHelper();

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Scaffold(
      drawer: CustomAppDrawer(),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.12,
            child: Image.asset("assets/images/splash_screen/splash_screen_bg.png",width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
          ),

          Column(
            children: [
              CustomAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height/3.5)-120,),
                        child: Image.asset("assets/images/splash_screen/ageo_logo.png",width: 265,),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  MaterialButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: (){

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
                                          // bool permissionGranted = await showDialog(context: context, builder: (BuildContext context){
                                          //   return DevicePermissionsHandler();
                                          // });
                                          // print(permissionGranted);
                                          // if(permissionGranted){
                                          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>DevicePermissionsHandler()));
                                          // }
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportEvent()));
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
