import 'package:ageo/controllers/main_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/language_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  CustomAppBar({Key? key,required this.title}) : super(key: key);
  final MainController _mainController=Get.find();
  final LanguageHelper _languageHelper=LanguageHelper();

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Container(
      height: 70,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.16),
      //       offset:const Offset(0, 2),
      //       blurRadius: 6,
      //     )
      //   ]
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // IconButton(
          //   icon:const Icon(Icons.arrow_back_ios_new,color: Color(0xff434343),),
          //   onPressed: (){
          //     Navigator.pop(context);
          //   },
          // ),
          Row(
            children: [
              Align(
                alignment:Alignment.centerLeft,
                child: Builder(
                    builder: (context) {
                      return MaterialButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          Scaffold.of(context).openDrawer();
                        },
                        child: Image.asset("assets/images/home_page/hamburger_menu.png",height: 60,width: 60,fit:BoxFit.fill),
                      );
                    }
                ),
              ),

              Text("$title ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: appTheme.primaryActionColor),),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              decoration:BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: appTheme.inputFieldsBorderColor),
                  borderRadius: BorderRadius.circular(4)
              ),
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  value: _mainController.appLanguage.value,
                  underline:const SizedBox(),
                  items: _languageHelper.languageNameList.map((String value) {
                    return DropdownMenuItem<String>(
                      key: Key(value),
                      value: value,
                      //child: new Text(value),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(value,style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,)),
                      ),
                    );
                  }).toList(),
                  onChanged: (language) {
                    if(language!=null) {
                      _mainController.changeAppLanguage(language: language,context: context);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
