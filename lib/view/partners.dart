import 'package:ageo/controllers/app_drawer_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/url_launcher.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Partners extends StatelessWidget {
  Partners({Key? key}) : super(key: key);
  final AppDrawerController _appDrawerController=Get.find();
  final List<Map<String,String>> _partnersDetailList=[
    {
      "name":"Instituto Superior Técnico Universidade de Lisboa",
      "icon_name":"instituto_superior_ic.png",
      "web_link":"https://tecnico.ulisboa.pt/en/"
    },
    {
      "name":"Associação Portuguesa de Geólogos",
      "icon_name":"associação_portuguesa_ic.png",
      "web_link":"http://www.apgeologos.pt/"
    },
    {
      "name":"La Palma Research Centre",
      "icon_name":"la_palma_ic.png",
      "web_link":"https://www.lapalmacentre.eu/"
    },{
      "name":"Instituto Geológico y Minero de España",
      "icon_name":"instituto_geológico_ic.png",
      "web_link":"https://www.igme.es/"
    },{
      "name":"Université de Bretagne Occidentale",
      "icon_name":"université_de_ic.png",
      "web_link":"https://www.univ-brest.fr/"
    },{
      "name":"Geological Survey of Northern Ireland",
      "icon_name":"geological_survey_ic.png",
      "web_link":"https://www2.bgs.ac.uk/gsni/"
    },{
      "name":"Laboratório Nacional de Engenharia Civil",
      "icon_name":"laboratório_nacional_ic.png",
      "web_link":"http://www.lnec.pt/en/"
    },{
      "name":"University College Dublin",
      "icon_name":"university_college_dublin_ic.png",
      "web_link":"https://www.ucd.ie/"
    },{
      "name":"Laboratório Nacional de Energia e Geologia",
      "icon_name":"laboratório_nacional_de_ic.png",
      "web_link":"https://www.lneg.pt/"
    },
    {
      "name":"Universidade da Madeira",
      "icon_name":"universidade_da_madeira_ic.png",
      "web_link":"https://www.uma.pt/"
    },{
      "name":"Universidad de La Laguna",
      "icon_name":"universidad_de_laguna_ic.png",
      "web_link":"https://www.ull.es/"
    },{
      "name":"Câmara Municipal de Lisboa",
      "icon_name":"câmara_municipal_ic.png",
      "web_link":"https://www.lisboa.pt/"
    },{
      "name":"Centre d’Etudes et d’Expertise sur les Risques Environnement Mobilité et Aménagement",
      "icon_name":"centre_d’Etudes_ic.png",
      "web_link":"https://www.cerema.fr/fr"
    }
  ];
  final CustomUrlLauncher _customUrlLauncher=CustomUrlLauncher();

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    bool isMobile=MediaQuery.of(context).size.shortestSide<600;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomAppDrawer(),
      body: WillPopScope(
        onWillPop: ()async{
          // when user press back button then this will mark home screen as active screen on ap drawer
          _appDrawerController.changeActiveButton(value: "home");
          return true;
        },
        child: Column(
          children: [
            CustomAppBar(title: tr("page_title.partners"),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: SingleChildScrollView(
                  child: Wrap(
                    // alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: List<Widget>.generate(_partnersDetailList.length, (index) {
                      return GestureDetector(
                        onTap: (){
                          _customUrlLauncher.openInBrowser(url: _partnersDetailList[index]["web_link"]??"");
                        },
                        child: Container(
                          height: 180,
                          width: 162,
                          decoration: BoxDecoration(
                              border: Border.all(color: appTheme.inputFieldsBorderColor),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding:const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/partners/${_partnersDetailList[index]["icon_name"]!}",height: isMobile? 80:60,),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text("${_partnersDetailList[index]["name"]}",style: TextStyle(fontSize: 12,color: appTheme.primaryActionColor),textAlign: TextAlign.center,),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
