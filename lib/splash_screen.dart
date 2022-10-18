import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

  }

  Future<void> startAnimation()async{
    Future.delayed(const Duration(milliseconds: 500),(){
      _controller.forward();
      print("Animation started");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,constraints){
          print("offset(${constraints.biggest},${constraints.maxHeight})");
          _offsetAnimation = Tween<Offset>(
            begin: const Offset(0, 10),
            end: Offset.zero,
          ).animate(_controller);
          startAnimation();
          return Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 0.12,
                child: Image.asset("assets/images/splash_screen/splash_screen_bg.png",width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
              ),
              Positioned(
                top: MediaQuery.of(context).size.width/2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 125),
                      child: Text("Welcome",style: TextStyle(fontSize: 29),),
                    ),

                    SlideTransition(
                      position: _offsetAnimation,
                      child: Image.asset("assets/images/splash_screen/ageo_logo.png",width: 265,),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
