import 'package:ageo/controllers/app_drawer_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppDrawer extends StatelessWidget {
  CustomAppDrawer({Key? key}) : super(key: key);
  final AppDrawerController _appDrawerController=Get.put(AppDrawerController());

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Drawer(
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
                  child: SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0,left: 16),
                          child: Image.asset("assets/images/app_drawer/home_ic.png",height: 23,),
                        ),
                        Text("Home",style: TextStyle(fontSize: 14,color: _appDrawerController.activeButton.value=="home"?Colors.white:appTheme.primaryActionColor),)
                      ],
                    ),
                  ),
                  onPressed: (){
_appDrawerController.changeActiveButton(value: "home");
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    // backgroundColor: appTheme.primaryActionColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0,left: 16),
                          child: Image.asset("assets/images/app_drawer/educational_ic.png",height: 23,),
                        ),
                        Text("Educational content",style: TextStyle(fontSize: 14,color: _appDrawerController.activeButton.value=="home"?Colors.white:appTheme.primaryActionColor),)
                      ],
                    ),
                  ),
                  onPressed: (){
_appDrawerController.changeActiveButton(value: "home");
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    // backgroundColor: appTheme.primaryActionColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0,left: 16),
                          child: Image.asset("assets/images/app_drawer/partners_ic.png",height: 23,),
                        ), Text("Partners",style: TextStyle(fontSize: 14,color: _appDrawerController.activeButton.value=="hom"?Colors.white:appTheme.primaryActionColor),)
                      ],
                    ),
                  ),
                  onPressed: (){
                    _appDrawerController.changeActiveButton(value: "hom");
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    // backgroundColor: appTheme.primaryActionColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0,left: 16),
                          child: Image.asset("assets/images/app_drawer/contact_ic.png",height: 23,),
                        ),
                        Text("Contact Us",style: TextStyle(fontSize: 14,color: _appDrawerController.activeButton.value=="contact"?Colors.white:appTheme.primaryActionColor),)
                      ],
                    ),
                  ),
                  onPressed:(){
                    _appDrawerController.changeActiveButton(value: "contact");
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    // backgroundColor: appTheme.primaryActionColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0,left: 16),
                          child: Image.asset("assets/images/app_drawer/about_ic.png",height: 23,),
                        ),
                        Text("About US",style: TextStyle(fontSize: 14,color: _appDrawerController.activeButton.value=="about"?Colors.white:appTheme.primaryActionColor),)
                      ],
                    ),
                  ),
                  onPressed: (){
                    _appDrawerController.changeActiveButton(value: "about");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
