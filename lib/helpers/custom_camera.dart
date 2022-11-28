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
    // this set camera controller and provide which camera to use
    _cameraController = CameraController(widget.cameraList[_activeCameraId], ResolutionPreset.max,enableAudio: false);
    // this st flesh mode to auto when user open initially
    _cameraController.setFlashMode(_flashMode);
    // this initialized camera controller and which all user to see live camera feed.
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
    // this function return icon for flash based on Camera flesh mode
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
    // this function stop listening to Magnetometer sensor stream
    streamSubscriptionMagnetometer.cancel();
  }
  void cloeStreamSubscriptionGyroscopeEvent(){
    // this function stop listening to Gyroscope sensor stream
    streamSubscriptionGyroscopeEvent.cancel();
  }
  void closeStreamSubscriptionAccelerometerEvent(){
    // this function stop listening to Accelerometer sensor stream
    streamSubscriptionAccelerometerEvent.cancel();
  }

  @override
  void dispose() {
    // this function destroy or release all controller and stream
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
                // this widget is use to set camera preview size on app display
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
                // this button used to switch between camera's
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
                // this button used to capture image
                icon: Icon(Icons.camera,color: appTheme.primaryActionColor,),
                onPressed: ()async{
                  try {
                    await _initializeControllerFuture;
                    // as soon as user capture capture image the sensor data must be capture
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
                    // this will push to new screen to show preview of capture image and ask user to approve or reject image
                    // if rejected then allow user to capture new image and if approved then save sensor date and go to previous page.
                    bool approved =await Navigator.of(context).push(MaterialPageRoute(builder: (context) => OpenImagePreview(imagePath: image.path,)),)??false;
                    if(approved){
                      _reportEventController.updateSensorDataForCameraClick(accelerometerEvent: accelerometerEvent, gyroscopeEvent: gyroscopeEvent, magnetometerEvent: magnetometerEvent);
                      Navigator.pop(context,image);
                    }
                  } catch (e) {
                    // print(e);
                  }
                },
              ),
              IconButton(
                // this button is used to toggle between camera flesh mode's
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