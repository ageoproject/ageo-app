import 'dart:io';
import 'package:ageo/ageoConfig.dart';
import 'package:ageo/controllers/app_drawer_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/url_launcher.dart';
import 'package:ageo/view/about.dart';
import 'package:ageo/view/contact.dart';
import 'package:ageo/view/partners.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppDrawer extends StatelessWidget {
  CustomAppDrawer({Key? key}) : super(key: key);
  final AppDrawerController _appDrawerController=Get.put(AppDrawerController());
  final CustomUrlLauncher _customUrlLauncher=CustomUrlLauncher();
  final AgeoConfig _ageoConfig=AgeoConfig();

  Color getButtonColor({required String buttonId,required CustomThemeData appTheme}){
    if(_appDrawerController.activeButton.value==buttonId){
      return appTheme.primaryActionColor;
    }else{
      return Colors.transparent;
    }
  }

  Color getIconAndTextColor({required String buttonId,required CustomThemeData appTheme}){
    if(_appDrawerController.activeButton.value==buttonId){
      return Colors.white;
    }else{
      return appTheme.primaryActionColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Drawer(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
                  child: Image.asset("assets/images/app_drawer/agro_logo_ic.png"),
                ),

                Obx(
                  ()=> Column(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          // backgroundColor: appTheme.primaryActionColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: getButtonColor(buttonId: "home", appTheme: appTheme),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 48,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 16),
                                child: Image.asset("assets/images/app_drawer/home_ic.png",height: 23,color: getIconAndTextColor(buttonId: "home", appTheme: appTheme),),
                              ),
                              Text("app_drawer.home",style: TextStyle(fontSize: 14,color: getIconAndTextColor(buttonId: "home", appTheme: appTheme)),).tr(),
                            ],
                          ),
                        ),
                        onPressed: (){
                          _appDrawerController.changeActiveButton(value: "home");
                          Scaffold.of(context).openEndDrawer();
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          // backgroundColor: appTheme.primaryActionColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: getButtonColor(buttonId: "educational", appTheme: appTheme),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 48,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 16),
                                child: Image.asset("assets/images/app_drawer/educational_ic.png",height: 23,color: getIconAndTextColor(buttonId: "educational", appTheme: appTheme),),
                              ),
                              Text("app_drawer.education",style: TextStyle(fontSize: 14,color: getIconAndTextColor(buttonId: "educational", appTheme: appTheme)),).tr()
                            ],
                          ),
                        ),
                        onPressed: (){
                          _appDrawerController.changeActiveButton(value: "educational");
                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          // backgroundColor: appTheme.primaryActionColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: getButtonColor(buttonId: "partners", appTheme: appTheme),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 48,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 16),
                                child: Image.asset("assets/images/app_drawer/partners_ic.png",height: 23,color: getIconAndTextColor(buttonId: "partners", appTheme: appTheme),),
                              ),
                              Text("app_drawer.partners",style: TextStyle(fontSize: 14,color:getIconAndTextColor(buttonId: "partners", appTheme: appTheme)),).tr()
                            ],
                          ),
                        ),
                        onPressed: (){
                          _appDrawerController.changeActiveButton(value: "partners");
                          Scaffold.of(context).openEndDrawer();
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Partners()), (route)=> route.isFirst);

                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          // backgroundColor: appTheme.primaryActionColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: getButtonColor(buttonId: "contact", appTheme: appTheme),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 48,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 16),
                                child: Image.asset("assets/images/app_drawer/contact_ic.png",height: 23,color: getIconAndTextColor(buttonId: "contact", appTheme: appTheme),),
                              ),
                              Text("app_drawer.contact",style: TextStyle(fontSize: 14,color: getIconAndTextColor(buttonId: "contact", appTheme: appTheme)),).tr()
                            ],
                          ),
                        ),
                        onPressed:(){
                          _appDrawerController.changeActiveButton(value: "contact");
                          Scaffold.of(context).openEndDrawer();
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUs()));
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ContactUs()), (route)=> route.isFirst);

                        },
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          // backgroundColor: appTheme.primaryActionColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: getButtonColor(buttonId: "about", appTheme: appTheme),
                          ),
                          height: 48,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 16),
                                child: Image.asset("assets/images/app_drawer/about_ic.png",height: 23,color: getIconAndTextColor(buttonId: "about", appTheme: appTheme)),
                              ),
                              Text("app_drawer.about",style: TextStyle(fontSize: 14,color: getIconAndTextColor(buttonId: "about", appTheme: appTheme)),).tr()
                            ],
                          ),
                        ),
                        onPressed: (){
                          Scaffold.of(context).openEndDrawer();
                          _appDrawerController.changeActiveButton(value: "about");
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUS()));
                          // Navigator.popUntil(context, (route) => route.isFirst);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AboutUS()), (route)=> route.isFirst);

                          // Navigator.of(context).popUntil((route) {
                          //   print("${route.settings.name},${route.isFirst}");
                          //   if (route.settings.name != "/home") return false;
                          //   return true;
                          // });
                          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AboutUS()), (route) => route.isFirst);
                        },
                      ),
                    ],
                  ),
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
                TextButton(
                  child: Text(_ageoConfig.frontendBasePath,style: TextStyle(fontSize: 14,color: appTheme.primaryActionColor),),
                  onPressed: (){
                    _customUrlLauncher.openInBrowser(url: _ageoConfig.frontendBasePath);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Platform.isIOS ? 18 : 0,top: 16),
                  child: Text("v1.0.5",style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
