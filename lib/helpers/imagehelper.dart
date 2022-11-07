import 'dart:io';
import 'dart:math';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/custom_camera.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector extends StatelessWidget {
   ImageSelector({Key? key}) : super(key: key);

  final ImagePicker _picker = ImagePicker();

   Future<String> getFileSize(String filepath, int decimals) async {
     var file = File(filepath);
     int bytes = await file.length();
     if (bytes <= 0) return "0 B";
     const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
     var i = (log(bytes) / log(1024)).floor();
     return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
   }

  @override
  Widget build(BuildContext context) {
     CustomThemeData appTheme=Theme.of(context).customTheme;
     return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            padding:const EdgeInsets.all(20),
            child: DefaultTextStyle(
              style:const  TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w400
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/report_event/camera_ic.png",color:appTheme.primaryTextColor,width: 26,),
                      TextButton(
                        child: Text("upload_image_alert.capture_with_camera",style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr(),
                        onPressed: ()async{
                          // XFile? cameraImage = await _picker.pickImage(source: ImageSource.camera);
                          // if(cameraImage!=null){
                          //   Navigator.pop(context,cameraImage);
                          // }
                          List<CameraDescription> cameraList = await availableCameras();
                          XFile? image=await Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraPage(cameraList: cameraList)));
                          Navigator.pop(context,image);
                        },
                      ),
                    ],
                  ),

                  Divider(color: appTheme.inputFieldsBorderColor,thickness: 1.5,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/report_event/media_ic.png",color:appTheme.primaryTextColor,width: 24),
                      TextButton(
                        child: Text("upload_image_alert.select_from_gallery",style:TextStyle(fontSize: 14,color: appTheme.primaryTextColor)).tr(),
                        onPressed: ()async{
                          XFile? galleryImage = await _picker.pickImage(source: ImageSource.gallery);
                          Navigator.pop(context,galleryImage);
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
