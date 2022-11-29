import 'dart:io';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OpenImagePreview extends StatelessWidget {
  // this class will allow to view image in app
  final String imagePath;
  final bool showActionButton;

  const OpenImagePreview({super.key, required this.imagePath, this.showActionButton = false});

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          CustomAppBar(title: tr("page_title.image_preview"),showBackButton: true,onBackButtonClick: (){Navigator.pop(context);},),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                padding:const EdgeInsets.all(8),
                child: Image.file(File(imagePath),
                )),
          ),
        ],
      )),
      bottomNavigationBar: showActionButton? Padding(
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
      ):const SizedBox(height: 0,),
    );
  }
}