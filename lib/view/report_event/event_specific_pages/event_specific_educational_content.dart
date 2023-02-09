import 'dart:async';
import 'package:ageo/controllers/main_controller.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class EventSpecificEducationalContent extends StatefulWidget {
  final String eventId, anchorSection;
  const EventSpecificEducationalContent({Key? key,required this.eventId,required this.anchorSection}) : super(key: key);

  @override
  State<EventSpecificEducationalContent> createState() => _EventSpecificEducationalContentState();
}

class _EventSpecificEducationalContentState extends State<EventSpecificEducationalContent> {
  // final CommonComponent _commonComponent=CommonComponent();
  final MainController _mainController=Get.find();

  late StreamSubscription<String> _languageStreamSubscription;

  String? _appLanguageCode;


  Future<void> loadEducationalContent({required InAppWebViewController controller})async{
    // await _controller.loadData( data: _commonComponent.educationalContent);
    _appLanguageCode=_mainController.appLanguageCode;
    await controller.loadFile( assetFilePath: 'assets/educational_content/educational-content.html');

    Future.delayed(const Duration(milliseconds: 500),() async{
      // print('${widget.eventId},${widget.anchorSection}');
      await controller.evaluateJavascript( source: 'changeEducationalContent("${widget.eventId}","${widget.anchorSection}")');
      await Future.delayed(const Duration(seconds: 1));
      // print(await controller.evaluateJavascript(source: "eventType"));
      // print(await controller.evaluateJavascript(source: "anchorSection"));
    });
  }

  // Future<void> checkAppLanguageChange({required InAppWebViewController controller})async{
  //   _languageStreamSubscription=_mainController.languageStreamController.stream.listen((event)async {
  //     if(_appLanguageCode!=event){
  //       _appLanguageCode=event;
  //       print("assets/educational_content/educational-content-$event.html");
  //       await controller.loadFile( assetFilePath: 'assets/educational_content/educational-content-es.html');
  //       Future.delayed(const Duration(milliseconds: 500),(){
  //         controller.evaluateJavascript( source: 'changeEducationalContent("${widget.eventId}","${widget.anchorSection}")');
  //       });
  //     }
  //   });
  // }

  @override
  void dispose() {
    // _languageStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(title: tr("app_drawer.educational"),showBackButton: true,onBackButtonClick: (){Navigator.pop(context);},),
          Expanded(
            child: InAppWebView(
              // initialUrlRequest: URLRequest(url: Uri.parse(url)),
              // initialData: InAppWebViewInitialData(data: _commonComponent.educationalContent,baseUrl: Uri.parse(url)),
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
                // controller.
                await loadEducationalContent(controller: controller);
                // await checkAppLanguageChange(controller: controller);
              },
              // onConsoleMessage: (InAppWebViewController controller, ConsoleMessage? m){
              //   print(m);
              // },

            ),
          ),
        ],
      ),
    );
  }
}
