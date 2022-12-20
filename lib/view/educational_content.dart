import 'package:ageo/controllers/app_drawer_controller.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class EducationalContent extends StatelessWidget {
  EducationalContent({Key? key}) : super(key: key);
  final AppDrawerController _appDrawerController=Get.find();
  late InAppWebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomAppDrawer(),
      body: WillPopScope(
        onWillPop: ()async{
          if(await _controller.canGoBack()){
            // this check if in web view user can go back or not
            await _controller.goBack();
            return false;
          }else{
            // when user press back button then this will mark home screen as active screen on ap drawer
            _appDrawerController.changeActiveButton(value: "home");
            return true;
          }
        },
        child: Column(
          children: [
            CustomAppBar(title: tr("app_drawer.educational"),),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse("https://ageoplatform.eu/education/ALL?isWebView=true")),
                initialOptions: InAppWebViewGroupOptions(

                    android: AndroidInAppWebViewOptions(
                      useHybridComposition: true,
                      //forceDark: AndroidForceDark.FORCE_DARK_AUTO,
                      //supportMultipleWindows: true,
                    ),
                    crossPlatform: InAppWebViewOptions(
                      cacheEnabled: true,
                      useShouldOverrideUrlLoading: true,
                      mediaPlaybackRequiresUserGesture: true,
                      horizontalScrollBarEnabled: false,
                      verticalScrollBarEnabled: false,
                      javaScriptEnabled: true,
                      supportZoom: true,
                      // disableContextMenu: true,
                      //javaScriptCanOpenWindowsAutomatically: true,
                    ),
                    ios: IOSInAppWebViewOptions(
                      allowsInlineMediaPlayback: true,
                      // disableLongPressContextMenuOnLinks: true,
                      // allowsLinkPreview: false,
                    )
                ),
                onWebViewCreated: (InAppWebViewController controller)async{
                  _controller=controller;
                  // controller.
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class EducationalContentWebView extends StatelessWidget {
//   const EducationalContentWebView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return WebView();
//   }
// }
