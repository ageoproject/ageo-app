import 'dart:io';
import 'package:ageo/ageoConfig.dart';
import 'package:ageo/controllers/app_drawer_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/url_launcher.dart';
import 'package:ageo/view/about.dart';
import 'package:ageo/view/contact.dart';
import 'package:ageo/view/educational_content.dart';
import 'package:ageo/view/partners.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppDrawer extends StatelessWidget {
  CustomAppDrawer({Key? key}) : super(key: key);
  final AppDrawerController _appDrawerController=Get.put(AppDrawerController());
  final CustomUrlLauncher _customUrlLauncher=CustomUrlLauncher();
  final AgeoConfig _ageoConfig=AgeoConfig();
  // this list contain localization language key, icon name and button id which allow to dynamically build multiple button of same type
  final List<Map<String,String>> _pagesList=[
    {
      "localization_ref":"app_drawer.home",
      "button_id":"home",
      "icon_name":"home_ic.png"
    },
    {
      "localization_ref":"app_drawer.educational",
      "button_id":"educational",
      "icon_name":"educational_ic.png"
    },
    {
      "localization_ref":"app_drawer.partners",
      "button_id":"partners",
      "icon_name":"partners_ic.png"
    },
    {
      "localization_ref":"app_drawer.contact",
      "button_id":"contact",
      "icon_name":"contact_ic.png"
    },
    {
      "localization_ref":"app_drawer.about",
      "button_id":"about",
      "icon_name":"about_ic.png"
    },
  ];

  Color getButtonColor({required String buttonId,required CustomThemeData appTheme}){
    // this function return color for app drawer button based on it's id
    if(_appDrawerController.activeButton.value==buttonId){
      return appTheme.primaryActionColor;
    }else{
      return Colors.transparent;
    }
  }

  Color getIconAndTextColor({required String buttonId,required CustomThemeData appTheme}){
    // this function return color for app drawer text based on it's id
    if(_appDrawerController.activeButton.value==buttonId){
      return Colors.white;
    }else{
      return appTheme.primaryActionColor;
    }
  }

  void clickTrigger({required String buttonId,required BuildContext context}){
    // this function select page based on button id and open that page
    switch(buttonId){
      case "home":{
        _appDrawerController.changeActiveButton(value: "home");
        Navigator.popUntil(context, (route) => route.isFirst);
        break;
      }
      case "educational":{
        _appDrawerController.changeActiveButton(value: "educational");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>EducationalContent()), (route)=> route.isFirst);
        break;
      }
      case "partners":{
        _appDrawerController.changeActiveButton(value: "partners");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Partners()), (route)=> route.isFirst);
        break;
      }
      case "contact":{
        _appDrawerController.changeActiveButton(value: "contact");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ContactUs()), (route)=> route.isFirst);
        break;
      }
      case "about":{
        _appDrawerController.changeActiveButton(value: "about");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AboutUS()), (route)=> route.isFirst);
        break;
      }
      default:{}
    }
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Drawer(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 260,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: ClipRRect(borderRadius: BorderRadius.circular(8),
                          child: Image.asset("assets/images/app_drawer/app_drawer_head.png",fit: BoxFit.fitHeight,height: 260,),
                        ),
                      ),
                    ],
                  ),
                ),

                Obx(
                  ()=> Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Column(
                      children: List.generate(_pagesList.length, (index) {
                        return TextButton(
                          style: TextButton.styleFrom(
                            // backgroundColor: appTheme.primaryActionColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: getButtonColor(buttonId: _pagesList[index]["button_id"]!, appTheme: appTheme),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            height: 48,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0,left: 16),
                                  child: Image.asset("assets/images/app_drawer/${_pagesList[index]["icon_name"]!}",height: 23,color: getIconAndTextColor(buttonId: _pagesList[index]["button_id"]!, appTheme: appTheme),),
                                ),
                                Text("${_pagesList[index]["localization_ref"]}",style: TextStyle(fontSize: 14,color: getIconAndTextColor(buttonId: _pagesList[index]["button_id"]!, appTheme: appTheme)),).tr(),
                              ],
                            ),
                          ),
                          onPressed: (){
                            clickTrigger(buttonId: _pagesList[index]["button_id"]!, context: context);
                          },
                        );
                      }),
                    ),
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
                TextButton(
                  child: Text("app_drawer.privacy_policy",style: TextStyle(fontSize: 14,color: appTheme.primaryActionColor),).tr(),
                  onPressed: (){
                    _customUrlLauncher.openInBrowser(url: "https://www.ageoplatform.eu/mobile-privacy-policy");
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Platform.isIOS ? 18 : 4,top: 16),
                  child: Text("${_ageoConfig.versionText} ",style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
