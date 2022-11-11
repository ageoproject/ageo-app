import 'dart:io';
import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/imagehelper.dart';
import 'package:ageo/view/report_event/submit_button.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonQuestions extends StatelessWidget {
  CommonQuestions({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final double _inputFieldBorderRadius = 4;
  final double _checkBoxBorderRadius=2;
  final TextEditingController _dateTextEditingController=TextEditingController();
  final TextEditingController _timeTextEditingController=TextEditingController();

  Future<DateTime?> openDateCalender({required BuildContext context,required String initialDate})async{
    // TimeOfDay? timeOfDay=await showTimePicker(context: context, initialTime: TimeOfDay.now());
    // DateTime? selectedDate = await showDatePicker(context: context, initialDate: DateTime.parse(initialDate), firstDate: DateTime(2020,1), lastDate: DateTime(DateTime.now().year+1));
    return await showDatePicker(context: context, initialDate: DateTime.parse(initialDate), firstDate: DateTime(2020,1), lastDate: DateTime(DateTime.now().year+1));

  }

  Future<TimeOfDay?> openTimeCalender({required BuildContext context,required String initialDateTime})async{
    return await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.parse(initialDateTime)),);
  }


  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    _reportEventController.changeEventDateAndTime();
    _dateTextEditingController.text=_reportEventController.eventDate.value;
    _timeTextEditingController.text=_reportEventController.eventTime.value;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: TextFormField(
                      // initialValue:_studentProfile.user?.dob==null?"": _component.formatDateMonthYearInWords.format(DateTime.parse("${_studentProfile.user!.dob}")),
                      controller: _dateTextEditingController,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      readOnly: true,
                      enableInteractiveSelection: false,
                      style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),
                      decoration: InputDecoration(
                        labelText: tr("common_question_page.event_date"),
                        labelStyle: TextStyle(fontSize: 14,color: appTheme.placeHolderTextColor),
                        suffixIcon: Icon(Icons.calendar_today_outlined,color: appTheme.iconColor,size: 20,),
                        filled: true,
                        fillColor: Colors.white,
                        errorMaxLines: 2,
                        contentPadding:const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(_inputFieldBorderRadius),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(_inputFieldBorderRadius),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(_inputFieldBorderRadius),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(_inputFieldBorderRadius),
                          ),
                        ),
                      ),
                      onTap: ()async{
                        DateTime? selectedDate =await openDateCalender(context: context, initialDate: _reportEventController.eventDate.value);
                        if(selectedDate!=null){
                          String date=selectedDate.toString().split(" ")[0];
                          _reportEventController.changeEventDate(date: date);
                          _dateTextEditingController.text=date;
                        }
                        // await _showCalendar(selectedDate: DateTime.parse("${_studentProfile.user!.dob}"));
                      },
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      // initialValue:_studentProfile.user?.dob==null?"": _component.formatDateMonthYearInWords.format(DateTime.parse("${_studentProfile.user!.dob}")),
                      controller: _timeTextEditingController,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      readOnly: true,
                      enableInteractiveSelection: false,
                      style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),
                      decoration: InputDecoration(
                        labelText: tr("common_question_page.event_time"),
                        labelStyle: TextStyle(fontSize: 14,color: appTheme.placeHolderTextColor),
                        suffixIcon: Icon(Icons.watch_later_outlined,color: appTheme.iconColor,size: 20,),
                        filled: true,
                        fillColor: Colors.white,
                        errorMaxLines: 2,
                        contentPadding:const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(_inputFieldBorderRadius),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(_inputFieldBorderRadius),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(_inputFieldBorderRadius),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(_inputFieldBorderRadius),
                          ),
                        ),
                      ),
                      onTap: ()async{
                        TimeOfDay? selectedTime= await openTimeCalender(context: context, initialDateTime: "${_reportEventController.eventDate.padLeft(2,"0")} ${_reportEventController.eventTime.value.padLeft(2,"0")}");
                        if(selectedTime!=null){
                          String eventTime="${selectedTime.hour.toString().padLeft(2,"0")}:${selectedTime.minute}";
                          _reportEventController.changeEventTime(date: eventTime);
                          _timeTextEditingController.text=eventTime;
                        }
                        // await _showCalendar(selectedDate: DateTime.parse("${_studentProfile.user!.dob}"));

                      },
                    ),
                  ),
                ],
              ),
              GetBuilder<ReportEventController>(
                builder:(_)=> Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: List.generate(_reportEventController.commonQuestion.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _reportEventController.commonQuestion[index]["answer"]=="YES"?appTheme.toggleSelectionColor:Colors.white,
                            borderRadius: BorderRadius.circular(_inputFieldBorderRadius),
                            border: Border.all(color: appTheme.inputFieldsBorderColor),
                          ),
                          padding:const EdgeInsets.symmetric(vertical: 12,horizontal: 14),
                          child: Row(
                            children: [
                              Container(
                                height:18,
                                padding: const EdgeInsets.only(right: 25),
                                child: Checkbox(
                                  value: _reportEventController.commonQuestion[index]["answer"]=="YES"?true:false,
                                  checkColor: appTheme.primaryActionColor,
                                  side: BorderSide(color: appTheme.inputFieldsBorderColor),
                                  fillColor: MaterialStateProperty.all(Colors.white),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_checkBoxBorderRadius)),
                                  onChanged: (value){
                                    if(value!=null){
                                    _reportEventController.updateAnswers(index: index, value: value?"YES":"NO");
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: Text("common_question_page.${_reportEventController.commonQuestion[index]["question"]}",style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr(),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("common_question_page.upload_or_capture",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color:appTheme.primaryTextColor),).tr(),
                    ),
                    GetBuilder<ReportEventController>(
                      builder:(_)=> Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(3, (index) {
                          if(_reportEventController.uploadedImageList.length>index){
                            return SizedBox(
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
                    ),
                  ],
                ),
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
      bottomNavigationBar: GetBuilder<ReportEventController>(
        builder:(_)=> _reportEventController.hasSpecificDamagePage.contains(_reportEventController.selectedEventType)? Visibility(
          visible: _reportEventController.uploadedImageList.isNotEmpty,
          child: SizedBox(
            height: Platform.isIOS? 66:40,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: appTheme.primaryActionColor,
              ),
              onPressed: (){
                _reportEventController.changeActiveTab(value: "damage");
              },
              child: const Text("common_key.next_btn",style: TextStyle(color: Colors.white,fontSize: 16),).tr(),
            ),
          ),
        ):Visibility(
          visible: _reportEventController.uploadedImageList.isNotEmpty,
          child: SubmitButton(),
        ),
      ),
    );
  }
}
