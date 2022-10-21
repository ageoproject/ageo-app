import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/language_helper.dart';
import 'package:ageo/controllers/main_controller.dart';
import 'package:ageo/view/app_drawer.dart';
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

          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
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

                    Padding(
                      padding: const EdgeInsets.all(16.0),
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
                            hint: Image.asset("assets/images/home_page/language_ic.png"),
                            // isExpanded: true,
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
                                          onPressed: (){

                                          },
                                          child:const Text("Monitor an event",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 30),
                                child: Text("Inform AGEO about geo - hazards and other incidents",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: appTheme.placeHolderTextColor),),
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
          ),
        ],
      ),
    );
  }
}
