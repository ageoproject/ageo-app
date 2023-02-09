import 'dart:io';
import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/imagehelper.dart';
import 'package:ageo/helpers/open_image_preview.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/report_event/event_type.dart';
import 'package:ageo/view/report_event/map_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuickReportEvent extends StatefulWidget {
  const QuickReportEvent({Key? key}) : super(key: key);

  @override
  State<QuickReportEvent> createState() => _QuickReportEventState();
}

class _QuickReportEventState extends State<QuickReportEvent> {
  final ReportEventController _reportEventController=Get.put(ReportEventController());
  late CustomThemeData appTheme;
  final double _inputFieldBorderRadius = 4;

  Widget buildImageAndCommentView(){
    bool isMobile=MediaQuery.of(context).size.shortestSide<600;
    return GetBuilder<ReportEventController>(
      builder:(_)=> Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: _reportEventController.nextAndSubmitButtonHeight),
            child: SingleChildScrollView(
              keyboardDismissBehavior: Platform.isAndroid? ScrollViewKeyboardDismissBehavior.manual :ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("common_question_page.quick_upload_or_capture",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color:appTheme.primaryTextColor),).tr(),
                        ),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: List.generate(3, (index) {
                            double cardWidthAndHeight=(MediaQuery.of(context).size.width/2)-24;
                            if(_reportEventController.uploadedImageList.length>index){
                              return SizedBox(
                                height: isMobile?cardWidthAndHeight:162,
                                width: isMobile?cardWidthAndHeight:162,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => OpenImagePreview(imagePath: _reportEventController.uploadedImageList[index].path)),);
                                  },
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(File(_reportEventController.uploadedImageList[index].path),fit: BoxFit.fill,height: isMobile?cardWidthAndHeight:162, width: isMobile?cardWidthAndHeight:162,),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          _reportEventController.deleteImage(image: _reportEventController.uploadedImageList[index]);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset("assets/images/report_event/close_ic.png",height: 24,),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }else{
                              return GestureDetector(
                                onTap: ()async{
                                  await showDialog(context: context, builder: (BuildContext context){
                                    return ImageSelector();
                                  });
                                },
                                child: Container(
                                  height: isMobile?cardWidthAndHeight:162,
                                  width: isMobile?cardWidthAndHeight:162,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: appTheme.inputFieldsBorderColor)
                                  ),
                                  child: Image.asset("assets/images/report_event/camera_ic.png",color: appTheme.primaryActionColor,width: 30,),
                                ),
                              );
                            }
                          }),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("common_question_page.add_comments",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color:appTheme.primaryTextColor),).tr(),
                          ),
                          TextFormField(
                            initialValue: _reportEventController.comment,
                            // initialValue:_studentProfile.user?.dob==null?"": _component.formatDateMonthYearInWords.format(DateTime.parse("${_studentProfile.user!.dob}")),
                            textInputAction: TextInputAction.newline,
                            minLines: 6,
                            maxLength: 1500,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),
                            decoration: InputDecoration(
                              hintText: tr("common_question_page.comment_hint"),
                              hintStyle: TextStyle(fontSize: 14,color: appTheme.placeHolderTextColor),
                              filled: true,
                              fillColor: Colors.white,
                              errorMaxLines: 2,
                              contentPadding:const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_inputFieldBorderRadius),
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_inputFieldBorderRadius),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_inputFieldBorderRadius),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color:appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_inputFieldBorderRadius),
                                ),
                              ),
                            ),
                            onChanged: (value){
                              _reportEventController.updateComment(comment: value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              // visible: _reportEventController.uploadedImageList.isNotEmpty,
              visible: true,
              child: Container(
                color:appTheme.primaryActionColor,
                // padding: EdgeInsets.only(bottom: 14),
                height: _reportEventController.nextAndSubmitButtonHeight,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: appTheme.primaryActionColor,
                  ),
                  onPressed: (){
                    _reportEventController.toggleQuickReportingState(value: true);
                    _reportEventController.changeActiveScreen(value: "map_view");
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: Platform.isIOS?8.0:0),
                    child: const Text("common_key.next_btn",style: TextStyle(color: Colors.white,fontSize: 16),).tr(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectScreen(){
    switch(_reportEventController.activeScreen.value){
      case "image_upload":{
        return buildImageAndCommentView();
      }
      case "map_view":{
        return const MapView();
      }
      case "event_type":{
        return EventTypeList();
      }
      default:{
       return Container();
      }
    }
  }

  /* Will Pop condition =>
  if(_reportEventController.activeScreen.value=="event_type"){
      _reportEventController.changeActiveScreen(value: "map_view");
      return false;
    }else if(_reportEventController.activeScreen.value=="map_view"){
      _reportEventController.changeActiveScreen(value: "image_upload");
      return false;
    }else{
      return true;
  }
   */

  void onBackButtonPress(){
    if(_reportEventController.activeScreen.value=="event_type"){
      _reportEventController.changeActiveScreen(value: "map_view");
    }else if(_reportEventController.activeScreen.value=="map_view"){
      _reportEventController.changeActiveScreen(value: "image_upload");
    }else{
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    appTheme=Theme.of(context).customTheme;
    _reportEventController.changeEventDateAndTime();
    return WillPopScope(
      onWillPop: ()async{
        onBackButtonPress();
        return false;
      },
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        body: Column(
          children: [
            CustomAppBar(title: tr("page_title.quick_monitor_event"),showBackButton: true,onBackButtonClick: onBackButtonPress,),
            Expanded(
              child: Obx(()=> selectScreen()),
              // child: MapView(),
            ),
          ],
        ),
      ),
    );
  }
}
