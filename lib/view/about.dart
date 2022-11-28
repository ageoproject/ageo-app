
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/app_drawer_controller.dart';

class AboutUS extends StatelessWidget {
  AboutUS({Key? key}) : super(key: key);
  final AppDrawerController _appDrawerController=Get.find();

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
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
            CustomAppBar(title: tr("page_title.about"),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset("assets/images/contact/ageo_contact_main.png",),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0,bottom: 14),
                        child: Text("About the AGEO Project",style: TextStyle(fontSize: 16,color: appTheme.primaryTextColor,fontWeight: FontWeight.w900),),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: appTheme.inputFieldsBorderColor),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        padding:const EdgeInsets.all(10),
                        child: Text("\nThe Platform for Atlantic Geohazard Risk Management (AGEO) is a project which aims to launch several Citizens’ Observatory pilots on geohazards according to regional priorities. These"
                            "will demonstrate how citizens’ involvement in geohazard risks prevention can strengthen regional and national risk management systems.\n\nThe Atlantic region is exposed to a range of"
                            "low-probability / high-impact events and various hazard risk scenarios, which, due to the low likelihood of occurrence and/or the high cost of mitigating action, lack the level of"
                            "preparedness for effective monitoring and response. AGEO aims to pilot a new form of engagement between civil society and local authorities for geohazards-related local capacity"
                            "building and encourage the local use of innovative Earth observation products and services provided by European data infrastructures, with special focus on the Copernicus platform."
                            "The project will foster a more efficient uptake of Copernicus data, products and services on regional level.\n\nAGEO will engage with local communities to actively participate in risk"
                            "preparedness and monitoring, and incorporate local capacities into risk management systems. Experiences gained during the implementation of the Citizens’ Observatory pilots will be"
                            "used to formulate recommendations for the creation of future observatories in response to the widest range of hazards (both natural and human-induced) faced in the Atlantic region.\n\n"
                            "AGEO’s main objectives are to:\n\n"
                            "\u2022 Encourage the regional-level uptake and use of products and services provided by European spatial data infrastructures, such as Copernicus or EGDI. \n\n"
                            "\u2022 Create a cooperation and resource platform on Atlantic geohazards risk assessment, preparedness, mitigation and prevention.\n\n"
                            "\u2022 Deliver concrete case studies to confirm the capacities of Citizens’ Observatories in improving risk management systems.\n",
                            textAlign:TextAlign.justify,style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,fontWeight: FontWeight.w400),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0,bottom: 14),
                        child: Text("About the Interreg Atlantic Area Programme",style: TextStyle(fontSize: 16,color: appTheme.primaryTextColor,fontWeight: FontWeight.w900),),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: appTheme.inputFieldsBorderColor),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        padding:const EdgeInsets.all(10),
                        child: Text("\nInterreg Atlantic Area Programme is a part of the European Union’s Cohesion Policy which prometes supports transnational cooperation projects in 36 Atlantic regions of 5 countries: "
                            "France, Ireland, Portugal, Spain and the United Kingdom, contributing to the achievement of economic, social and territorial cohesion. The Programme overall objective is to support "
                            "sustainable growth and regional development by implementing solutions to answer the regional challenges in the fields of Innovation & Competitiveness, Resource Efficiency, "
                            "Territorial Risks Management, Environment, Biodiversity and Natural & Cultural Assets.\n"
                            "\nThe Programme focuses on four main priorities axes and specific objectives related:\n"
                            "\n\u2022 Priority 1: Stimulating innovation and competitiveness (EUR 62.8 million)\n"
                            "\n\u2022 Priority 2: Fostering resource efficiency (EUR 39.7 million)\n"
                            "\n\u2022 Priority 3: Strengthening the territory’s resilience to risks of natural, climate and human origin (EUR 20.3 million)\n"
                            "\n\u2022 Priority 4: Technical Assistance (EUR 9.9 million)\n", textAlign:TextAlign.justify,style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,fontWeight: FontWeight.w400)),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: appTheme.inputFieldsBorderColor),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding:const EdgeInsets.all(10),
                          child: Text("The AGEO Proejct is funded by Interreg Atlantic Area, a European funding programme with a total budget of € 185 million, which comprises a fund allocation above € 140 million from "
                              "the European Regional Development Fund (ERDF).", textAlign:TextAlign.center,style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/contact/ageo_contact_logo.png",height: 50,),
                      )
                    ],
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
