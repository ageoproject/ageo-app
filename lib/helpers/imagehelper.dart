import 'package:ageo/helpers/dashSeparator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector extends StatelessWidget {
   ImageSelector({Key? key}) : super(key: key);

  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {

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
                TextButton(
                  child:const Text("Click Picture",),
                  onPressed: ()async{
                    XFile? cameraImage = await _picker.pickImage(source: ImageSource.camera);
                    if(cameraImage!=null){
                      Navigator.pop(context,cameraImage);
                    }
                  },
                ),
                const DashSeparator(),

                TextButton(
                  child: const Text("select from gallery"),
                  onPressed: ()async{
                    XFile? galleryImage = await _picker.pickImage(source: ImageSource.gallery);
                    if(galleryImage!=null){
                      Navigator.pop(context,galleryImage);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
