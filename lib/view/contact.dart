import 'package:ageo/controllers/app_drawer_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/url_launcher.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUs extends StatelessWidget {
  ContactUs({Key? key}) : super(key: key);

  final AppDrawerController _appDrawerController=Get.find();
  final CustomUrlLauncher _customUrlLauncher=CustomUrlLauncher();
  final String _ageoContactLink="https://ageoatlantic.eu/";

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomAppDrawer(),
      body: WillPopScope(
        onWillPop: ()async{
          // when user press back button then this will mark home screen as active screen on ap drawer
          _appDrawerController.changeActiveButton(value: "home");
          return true;
        },
        child: Column(
          children: [
            CustomAppBar(title: tr("page_title.contact"),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("assets/images/contact/ageo_contact_main.png",),
                      ),

                      Padding(
                        padding:const EdgeInsets.only(top: 25),
                        child: Text("contact_us",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: appTheme.primaryTextColor),).tr(),
                      ),
                      TextButton(
                        child: Text(_ageoContactLink.replaceFirst("https://", "www."),style: TextStyle(fontSize: 16,color: appTheme.primaryActionColor,decoration: TextDecoration.underline)),
                        onPressed: (){
                          _customUrlLauncher.openInBrowser(url: _ageoContactLink);
                        },
                      ),

                      Padding(
                        padding:const EdgeInsets.symmetric(vertical: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:Border.all(color: appTheme.inputFieldsBorderColor)
                              ),
                              child: IconButton(
                                icon: Image.asset("assets/images/contact/facebook_ic.png"),
                                onPressed: (){
                                  _customUrlLauncher.openInBrowser(url: "https://www.facebook.com/100057332564486/");
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:Border.all(color: appTheme.inputFieldsBorderColor)
                              ),
                              child: IconButton(
                                icon: Image.asset("assets/images/contact/twitter_ic.png"),
                                onPressed: (){
                                  // String link="fb://profile/100057332564486";
                                  // _customUrlLauncher.openInBrowser(url: link);
                                  _customUrlLauncher.openInBrowser(url: "https://twitter.com/AgeoAtlantic/");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      Image.asset("assets/images/contact/ageo_contact_logo.png",height: 50,)
                    ],
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
