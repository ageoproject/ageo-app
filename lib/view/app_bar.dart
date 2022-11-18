import 'package:ageo/controllers/main_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/language_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool showBackButton;
  Function? onBackButtonClick=(){};
  CustomAppBar({Key? key,this.title,this.showBackButton=false,this.onBackButtonClick}) : super(key: key);
  final MainController _mainController=Get.find();
  final LanguageHelper _languageHelper=LanguageHelper();

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top+10),
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Builder(
                      builder: (context) {
                        return MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            if(showBackButton){
                              onBackButtonClick!();
                            }else{
                              Scaffold.of(context).openDrawer();
                            }
                          },
                          child: Image.asset(showBackButton?"assets/images/report_event/back_button_ic.png":"assets/images/home_page/hamburger_menu.png",height: 67,width: 67,fit:BoxFit.fill),
                        );
                      }
                  ),
                ),

                Visibility(
                  visible: title != null,
                  child: Text("$title ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: appTheme.primaryActionColor),),
                ),
              ],
            ),

            Flexible(
              fit:FlexFit.loose,
              child: Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
