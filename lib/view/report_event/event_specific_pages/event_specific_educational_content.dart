import 'package:ageo/view/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class EventSpecificEducationalContent extends StatelessWidget {
  final String eventId, anchorSection;
  const EventSpecificEducationalContent({Key? key,required this.eventId,required this.anchorSection}) : super(key: key);
  // final CommonComponent _commonComponent=CommonComponent();
  // late InAppWebViewController _controller;

  Future<void> loadEducationalContent({required InAppWebViewController controller})async{
    // await _controller.loadData( data: _commonComponent.educationalContent);
    await controller.loadFile( assetFilePath: 'assets/educational_content/educational-content.html');

    Future.delayed(const Duration(milliseconds: 500),(){
      controller.evaluateJavascript( source: 'changeEducationalContent("$eventId","$anchorSection")');
    });
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
                loadEducationalContent(controller: controller);
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
