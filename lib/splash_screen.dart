// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//
//   late final AnimationController _controller ;
//
//   late final Animation<Offset> _offsetAnimation;
//
//
//   Future<void> startAnimation()async{
//     _controller = AnimationController(
//       duration:const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _offsetAnimation = Tween<Offset>(
//       begin: const Offset(0, 5.5),
//       end: Offset.zero,
//     ).animate(_controller);
//     Future.delayed(const Duration(milliseconds: 300),(){
//       _controller.forward();
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     startAnimation();
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           Opacity(
//             opacity: 0.12,
//             child: Image.asset("assets/images/splash_screen/splash_screen_bg.png",width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
//           ),
//           Positioned(
//             top: MediaQuery.of(context).size.width/2,
//             child: SlideTransition(
//               position: _offsetAnimation,
//               child: Image.asset("assets/images/splash_screen/ageo_logo.png",width: 265,),
//             ),
//           )
//         ],
//       ),
//
//     );
//   }
// }
