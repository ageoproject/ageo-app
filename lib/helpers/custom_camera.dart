import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/open_image_preview.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameraList;
  const CameraPage({Key? key,required this.cameraList}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  int _activeCameraId=0;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(widget.cameraList[_activeCameraId], ResolutionPreset.max,enableAudio: false);
    _initializeControllerFuture = _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // print('User denied camera access.');
            break;
          default:
            // print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Scaffold(
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Transform.scale(
                scale: 1/(_cameraController.value.aspectRatio  * MediaQuery.of(context).size.aspectRatio),
                child: CameraPreview(_cameraController),
              );
            }else{
              return Center(child: CircularProgressIndicator(color: appTheme.primaryActionColor,));
            }
          }
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(18.0,8,18,18),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon:const Icon(Icons.cameraswitch_outlined),
                onPressed: ()async{
                  // print("${widget.cameraList.length} $_activeCameraId");
                  if(widget.cameraList.length>_activeCameraId+1){
                    _activeCameraId+=1;
                  }else{
                    _activeCameraId=0;
                  }

                  _cameraController = CameraController(widget.cameraList[_activeCameraId], ResolutionPreset.max,enableAudio: false);
                  _initializeControllerFuture = _cameraController.initialize().then((_) {
                    if (!mounted) {
                      return;
                    }
                    setState(() {});
                  });


                },
              ),
              IconButton(
                icon: Icon(Icons.camera,color: appTheme.primaryActionColor,),
                onPressed: ()async{
                  try {
                    await _initializeControllerFuture;

                    final XFile image = await _cameraController.takePicture();

                    if (!mounted) return;

                    bool approved =await Navigator.of(context).push(MaterialPageRoute(builder: (context) => OpenImagePreview(imagePath: image.path,)),);
                    if(approved){
                      Navigator.pop(context,image);
                    }
                  } catch (_) {}
                },
              ),
              IconButton(
                icon: Image.asset("assets/images/report_event/media_ic.png",height: 20,),
                onPressed: (){},
              ),
            ],
          ),
        ),
      );
  }
}