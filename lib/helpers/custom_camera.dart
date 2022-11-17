import 'dart:async';
import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/open_image_preview.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameraList;
  const CameraPage({Key? key,required this.cameraList}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final ReportEventController _reportEventController=Get.find();
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  int _activeCameraId=0;
  late CustomThemeData appTheme;
  FlashMode _flashMode=FlashMode.auto;
  late StreamSubscription<MagnetometerEvent> streamSubscriptionMagnetometer;
  late StreamSubscription<GyroscopeEvent> streamSubscriptionGyroscopeEvent;
  late StreamSubscription<AccelerometerEvent> streamSubscriptionAccelerometerEvent;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(widget.cameraList[_activeCameraId], ResolutionPreset.max,enableAudio: false);
    _cameraController.setFlashMode(_flashMode);
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

  Widget buildFlashButton(){
    switch(_flashMode){
      case FlashMode.auto:{
        return Icon(Icons.flash_auto,color: appTheme.iconColor,);
      }
      case FlashMode.off:{
        return Icon(Icons.flash_off,color: appTheme.iconColor,);
      }
      case FlashMode.always:{
        return Icon(Icons.flash_on,color: appTheme.iconColor,);
      }
      default:{
        return Container();
      }
    }
  }

  void closeStreamSubscriptionMagnetometer(){
    streamSubscriptionMagnetometer.cancel();
  }
  void cloeStreamSubscriptionGyroscopeEvent(){
    streamSubscriptionGyroscopeEvent.cancel();
  }
  void closeStreamSubscriptionAccelerometerEvent(){
    streamSubscriptionAccelerometerEvent.cancel();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    streamSubscriptionMagnetometer.cancel();
    streamSubscriptionGyroscopeEvent.cancel();
    streamSubscriptionAccelerometerEvent.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    appTheme=Theme.of(context).customTheme;
    return Scaffold(
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              // print(1/(_cameraController.value.aspectRatio  * MediaQuery.of(context).size.aspectRatio));
              return Transform.scale(
                scale: 1.2270833333333335,
                child: Center(child: CameraPreview(_cameraController)),
              );
            }else{
              return Center(child: CircularProgressIndicator(color: appTheme.primaryActionColor,));
            }
          }
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
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

                    AccelerometerEvent accelerometerEvent=AccelerometerEvent(0.0, 0.0, 0.0);
                    GyroscopeEvent gyroscopeEvent=GyroscopeEvent(0.0, 0.0, 0.0);
                    MagnetometerEvent magnetometerEvent=MagnetometerEvent(0.0, 0.0, 0.0);
                    streamSubscriptionAccelerometerEvent = accelerometerEvents.listen((AccelerometerEvent event) {
                      accelerometerEvent=event;
                      closeStreamSubscriptionAccelerometerEvent();
                    });

                    streamSubscriptionGyroscopeEvent = gyroscopeEvents.listen((GyroscopeEvent event) {
                      gyroscopeEvent=event;
                      cloeStreamSubscriptionGyroscopeEvent();
                    });

                    streamSubscriptionMagnetometer = magnetometerEvents.listen((MagnetometerEvent event) {
                      magnetometerEvent=event;
                      closeStreamSubscriptionMagnetometer();
                    });

                    final XFile image = await _cameraController.takePicture();

                    if (!mounted) return;

                    bool approved =await Navigator.of(context).push(MaterialPageRoute(builder: (context) => OpenImagePreview(imagePath: image.path,)),);
                    if(approved){
                      _reportEventController.updateSensorData(accelerometerEvent: accelerometerEvent, gyroscopeEvent: gyroscopeEvent, magnetometerEvent: magnetometerEvent);
                      Navigator.pop(context,image);
                    }
                  } catch (e) {
                    // print(e);
                  }
                },
              ),
              IconButton(
                icon: buildFlashButton(),
                onPressed: ()async{
                  if(_flashMode==FlashMode.auto){
                    _flashMode=FlashMode.always;
                  }else if(_flashMode==FlashMode.always){
                    _flashMode=FlashMode.off;
                  }else{
                    _flashMode=FlashMode.auto;
                  }
                  await _cameraController.setFlashMode(_flashMode);
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      );
  }
}