import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:ageo/view/report_event/app_bar.dart';
import 'package:ageo/view/report_event/custom_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportEvent extends StatelessWidget {
  ReportEvent({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.put(ReportEventController());

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Scaffold(
      drawer: CustomAppDrawer(),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: Column(
          children: [
            CustomAppBar(title: "Select Event type",),
            CustomTabView()
          ],
        ),
      ),
    );
  }
}
