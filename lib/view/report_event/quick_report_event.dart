import 'dart:io';
import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/imagehelper.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/report_event/event_type.dart';
import 'package:ageo/view/report_event/map_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
    return GetBuilder<ReportEventController>(
      builder:(_)=> SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("common_question_page.upload_or_capture",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color:appTheme.primaryTextColor),).tr(),
                  ),
                  Wrap(
                    children: List.generate(3, (index) {
                      if(_reportEventController.uploadedImageList.length>index){
                        return Padding(
                          padding: EdgeInsets.only(top:12.0,left: index%2==0?0:12),
                          child: SizedBox(
                            height: 162,
                            width: 162,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(File(_reportEventController.uploadedImageList[index].path),fit: BoxFit.fill,height: 165, width: 165,),
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
                        return Padding(
                          padding: EdgeInsets.only(top:12.0,left: index%2==0?0:12),
                          child: GestureDetector(
                            onTap: ()async{
                              XFile? image=await showDialog(context: context, builder: (BuildContext context){
                                return ImageSelector();
                              });
                              if(image!=null){
                                _reportEventController.addImage(image: image);
                              }
                            },
                            child: Container(
                              height: 162,
                              width: 162,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: appTheme.inputFieldsBorderColor)
                              ),
                              child: Image.asset("assets/images/report_event/camera_ic.png",color: appTheme.primaryActionColor,width: 30,),
                            ),
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
                      // initialValue:_studentProfile.user?.dob==null?"": _component.formatDateMonthYearInWords.format(DateTime.parse("${_studentProfile.user!.dob}")),
                      textInputAction: TextInputAction.next,
                      minLines: 6,
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

  @override
  Widget build(BuildContext context) {
    appTheme=Theme.of(context).customTheme;
    _reportEventController.changeEventDateAndTime();
    return WillPopScope(
      onWillPop:()async{
        if(_reportEventController.activeScreen.value=="event_type"){
          _reportEventController.changeActiveScreen(value: "map_view");
          return false;
        }else if(_reportEventController.activeScreen.value=="map_view"){
          _reportEventController.changeActiveScreen(value: "image_upload");
          return false;
        }else{
          return true;
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: "Quick Monitor Event",),
            Expanded(
              child: Obx(()=> selectScreen()),
              // child: MapView(),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<ReportEventController>(builder:(_) => _reportEventController.activeScreen.value=="image_upload"?Visibility(
          visible: _reportEventController.uploadedImageList.isNotEmpty,
          child: SizedBox(
            height: Platform.isIOS? 66:40,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: appTheme.primaryActionColor,
              ),
              onPressed: (){
                _reportEventController.toggleQuickReportingState();
                _reportEventController.changeActiveScreen(value: "map_view");
              },
              child: const Text("common_key.next_btn",style: TextStyle(color: Colors.white,fontSize: 16),).tr(),
            ),
          ),
        ):const SizedBox()),
      ),
    );
  }
}
