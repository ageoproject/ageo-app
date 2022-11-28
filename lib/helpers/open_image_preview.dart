import 'dart:io';
import 'package:ageo/helpers/app_theme.dart';
import 'package:flutter/material.dart';

class OpenImagePreview extends StatelessWidget {
  // this class will allow to view image in app
  final String imagePath;

  const OpenImagePreview({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,),
      body: SafeArea(child: Container(
          alignment: Alignment.center,
          padding:const EdgeInsets.all(8),
          child: Image.file(File(imagePath),
          ))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 18),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: appTheme.inputFieldsBorderColor),
              ),
              child: IconButton(
                icon:const Icon(Icons.close,color: Colors.white,),
                onPressed: (){
                  Navigator.pop(context,false);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: appTheme.primaryActionColor,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: appTheme.inputFieldsBorderColor),
              ),
              child: IconButton(
                icon:const Icon(Icons.check,color: Colors.white,),
                onPressed: (){
                  Navigator.pop(context,true);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}