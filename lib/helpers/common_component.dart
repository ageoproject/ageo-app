import 'package:ageo/ageoConfig.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/toast_message.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class CommonComponent{
  late CustomThemeData _appTheme;
  final CustomToastMessage _toastMessage=CustomToastMessage();

  void initializeLoader({required BuildContext context,String? message}){
    _appTheme=Theme.of(context).customTheme;
    TextStyle inputStyle=const TextStyle(fontSize: 14,color: Colors.white);
    showDialog(context: context,barrierDismissible: false,useRootNavigator: false, builder: (BuildContext context){
      return WillPopScope(
        onWillPop:()async{
          return false;
        },
        child: Center(
          child: Container(
            padding:const EdgeInsets.all(20),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              color: _appTheme.primaryActionColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Icon(Icons.wifi_off_outlined,size: 40,color: Colors.white,),
                    CircularProgressIndicator(color: _appTheme.primaryActionColor,backgroundColor: Colors.white),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text("monitor_event.please_wait",style: inputStyle,textAlign: TextAlign.center,).tr(),
                    ),
                    Text("$message",style: inputStyle,textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  void  showEventShareDialog({required BuildContext context,required String message}){
    _appTheme=Theme.of(context).customTheme;
    AgeoConfig ageoConfig=AgeoConfig();
    String eventLink="${ageoConfig.frontendBasePath}/$message";
    showDialog(context: context,barrierDismissible: false,useRootNavigator: false, builder: (BuildContext context){
      return WillPopScope(
        onWillPop:()async{
          return false;
        },
        child: Center(
          child:Container(
            height: 200,
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 180,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Image.asset("assets/images/report_event/close_ic.png",width: 28,),
                            onPressed: (){
                              Navigator.popUntil(context, (route) => route.isFirst);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Icon(Icons.check,color: _appTheme.primaryActionColor,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text("monitor_event.send_ageo",style: TextStyle(color:_appTheme.primaryTextColor,fontSize: 14),).tr(),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: (){


                                        },
                                        child: Text(eventLink,style: TextStyle(color: _appTheme.primaryActionColor,fontSize: 14,decoration: TextDecoration.underline),),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Image.asset("assets/images/report_event/copy_ic.png",height: 20,),
                                      onPressed: ()async{
                                        await Clipboard.setData(ClipboardData(text: eventLink));
                                        _toastMessage.showSuccessToastMessage(message: tr("monitor_event.linked_copied"), duration: 1, context: context);
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: _appTheme.primaryActionColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset("assets/images/report_event/share_ic.png",height: 15,),
                          ),
                          const Text("monitor_event.share",style: TextStyle(color: Colors.white,fontSize: 14),).tr(),
                        ],
                      ),
                      onPressed: (){
                        Share.share(eventLink);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}