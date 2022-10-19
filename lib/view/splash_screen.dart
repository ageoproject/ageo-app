import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late final AnimationController _controller ;

  late final Animation<Offset> _offsetAnimation;


  Future<void> startAnimation({required bool isMobile})async{
    _controller = AnimationController(
      duration: Duration(milliseconds: isMobile? 500:500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 5.5),
      end: Offset.zero,
    ).animate(_controller);
    Future.delayed(const Duration(milliseconds: 300),(){
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
    bool isMobile=MediaQuery.of(context).size.shortestSide<600;
    startAnimation(isMobile: isMobile);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.12,
            child: Image.asset("assets/images/splash_screen/splash_screen_bg.png",width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width/2,
            child: SlideTransition(
              position: _offsetAnimation,
              child: Image.asset("assets/images/splash_screen/ageo_logo.png",width: 265,),
            ),
          )
        ],
      ),

    );
  }
}
