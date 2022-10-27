
import 'package:ageo/controllers/app_drawer_controller.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class ContactUs extends StatelessWidget {
  ContactUs({Key? key}) : super(key: key);

  final AppDrawerController _appDrawerController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomAppDrawer(),
      body: WillPopScope(
        onWillPop: ()async{
          _appDrawerController.changeActiveButton(value: "home");
          return true;
        },
        child: SafeArea(
          child: Column(
            children: [
              Builder(
                  builder: (context) {
                    return MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        Scaffold.of(context).openDrawer();
                      },
                      child: Image.asset("assets/images/home_page/hamburger_menu.png",height: 60,width: 60,fit:BoxFit.fill),
                    );
                  }
              ),
              Container(
                child: Text("This is contact page "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
