import 'package:ageo/ageoConfig.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  final AgeoConfig _ageoConfig = AgeoConfig();
  late final AnimationController _controller = AnimationController(
    duration:const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 5.5),
    end: Offset.zero,
  ).animate(_controller);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800),()async{
      // start splash screen animation after 800 millisecond
      _controller.forward();
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.12,
            child: Image.asset("assets/images/splash_screen/splash_screen_bg.png",width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/3.5,
            child: SlideTransition(
              position: _offsetAnimation,
              child: Image.asset("assets/images/splash_screen/ageo_logo.png",width: 265,),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Text("${_ageoConfig.versionText} ",style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),)
          )
        ],
      ),

    );
  }
}
