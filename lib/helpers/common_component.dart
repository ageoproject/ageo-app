
import 'package:ageo/helpers/app_theme.dart';
import 'package:flutter/material.dart';

class CommonComponent{
  late CustomThemeData _appTheme;
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
                      child: Text("Please wait..",style: inputStyle,textAlign: TextAlign.center,),
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
}