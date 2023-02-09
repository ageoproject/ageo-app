import 'dart:async';
import 'package:ageo/controllers/main_controller.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class EducationalContent extends StatefulWidget {
  const EducationalContent({Key? key}) : super(key: key);

  @override
  State<EducationalContent> createState() => _EducationalContentState();
}

class _EducationalContentState extends State<EducationalContent> {
  final MainController _mainController=Get.find();

  // late StreamSubscription<String> _languageStreamSubscription;

  String? _appLanguageCode;

  // final CommonComponent _commonComponent=CommonComponent();
  Future<void> loadEducationalContent({required InAppWebViewController controller})async{
    _appLanguageCode=_mainController.appLanguageCode;
    await controller.loadFile( assetFilePath: 'assets/educational_content/educational-content.html');
    Future.delayed(const Duration(milliseconds: 500),(){
      controller.evaluateJavascript( source: 'changeEducationalContent("ALL","")');
    });
  }

  // Future<void> checkAppLanguageChange({required InAppWebViewController controller})async{
  //   _languageStreamSubscription=_mainController.languageStreamController.stream.listen((event)async {
  //     if(_appLanguageCode!=event){
  //       _appLanguageCode=event;
  //       print("assets/educational_content/educational-content-$event.html");
  //       await controller.loadFile( assetFilePath: 'assets/educational_content/educational-content-es.html');
  //       Future.delayed(const Duration(milliseconds: 500),(){
  //         controller.evaluateJavascript( source: 'changeEducationalContent("ALL","")');
  //       });
  //     }
  //   });
  // }

  @override
  void dispose() {
    // _languageStreamSubscription.cancel();
    super.dispose();
  }
  // onWillPop: ()async{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomAppDrawer(),
      body: Column(
        children: [
          CustomAppBar(title: tr("app_drawer.educational"),),
          Expanded(
            child: InAppWebView(
              // initialData: InAppWebViewInitialData(data: _commonComponent.educationalContent),
              // initialUrlRequest: URLRequest(url: Uri.parse("https://ageoplatform.eu/education/ALL?isWebView=true")),
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
                // _controller=controller;
                await loadEducationalContent(controller: controller);
                // await checkAppLanguageChange(controller: controller);
                // controller.
                },
            ),
          ),
        ],
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
