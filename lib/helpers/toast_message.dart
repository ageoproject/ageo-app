import 'package:flutter/material.dart';

class CustomToastMessage{
  final Color _toastBackgroundColor=const Color(0xff105268);
  final Color _iconColor=const Color(0xffDDEEF2);
  final TextStyle _toastMessageStyle=const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xffDDEEF2));
  final double _borderRadius=18.0;

  void showErrorToastMessage({required String message, required int duration, required BuildContext context}){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: _toastBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration),
      content: Container(
        padding:const EdgeInsets.only(right: 8),
        child: Row(
          children: [
            Container(
              padding:const EdgeInsets.symmetric(horizontal: 16),
              child:Icon(Icons.warning_amber_rounded,color: _iconColor,),
            ),
            Flexible(child: Text(message,style: _toastMessageStyle)),
          ],
        ),
      ),
    ),);
  }

  void showSuccessToastMessage({required String message, required int duration, required BuildContext context}){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: _toastBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration),
      content: Container(
        padding:const EdgeInsets.only(right: 8),
        child: Row(
          children: [
            Container(
              padding:const EdgeInsets.symmetric(horizontal: 16),
              child:Icon(Icons.done_rounded,color: _iconColor,),
            ),
            Flexible(child: Text(message,style: _toastMessageStyle)),
          ],
        ),
      ),
    ),);
  }

  void showWarningToastMessage({required String message, required int duration, required BuildContext context}){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: _toastBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration),
      content: Container(
        padding:const EdgeInsets.only(right: 8),
        child: Row(
          children: [
            Container(
              padding:const EdgeInsets.symmetric(horizontal: 16),
              child:Icon(Icons.warning_amber_rounded,color: _iconColor,),
            ),
            Flexible(child: Text(message,style: _toastMessageStyle)),
          ],
        ),
      ),
    ),);
  }

  void showLoadingToastMessage({required String message, required int duration, required BuildContext context}){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: _toastBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration),
      content: Container(
        padding:const  EdgeInsets.only(right: 8),
        child: Row(
          children: [
            Container(
              padding:const EdgeInsets.symmetric(horizontal: 16),
              child:CircularProgressIndicator(color: _iconColor,),
            ),
            Flexible(child: Text(message,style: _toastMessageStyle)),
          ],
        ),
      ),
    ),);
  }

  void showToastMessage({required String message, required int duration, required BuildContext context}){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: _toastBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: duration),
        content: Container(
          padding:const EdgeInsets.only(right: 8),
          child: Text(message,style: _toastMessageStyle),
        )
    ),);
  }
}