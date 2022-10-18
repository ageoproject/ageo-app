import 'dart:io';
import 'dart:math';

import 'package:ageo/ageoConfig.dart';
import 'package:ageo/helpers/imagehelper.dart';
import 'package:ageo/mapView.dart';
import 'package:ageo/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        fontFamily: "Oktaneue",
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: "Oktaneue",
        brightness: Brightness.light,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<XFile> _imageList=[];

  Future<XFile?> uploadImage()async{
    return await showDialog(context: context, builder: (BuildContext context){
      return ImageSelector();
    });
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text('', style: Theme.of(context).textTheme.headline4,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          // XFile? image=await uploadImage();
          // if(image!=null){
          //  _imageList.add(image);
          //
          //  String fileSize=await getFileSize(image.path, 1);
          //  print("this is length of ImageList => ${_imageList.length} and file details is => $fileSize");
          // }

          // AgeoConfig ageoConfig=AgeoConfig();
          // String? eventId=await ageoConfig.reportEvent();

          Navigator.push(context, MaterialPageRoute(builder: (context)=> const SplashScreen()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
