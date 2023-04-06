import 'package:flutter/material.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import '../../../../service/configs/appColors.dart';
import '../../../../service/willPopScope/willPopscope.dart';
import '../../../components/job/latestJobCircularComponent.dart';
import '../../../widgets/card/customCard.dart';
import '../../../widgets/text/kText.dart';
import '../../home/homePage.dart';

class LatestCircularJobPage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopScope(routeName: HomePage()),
      child: Scaffold(
        appBar: AppBar(
          title: KText(
            text: 'Latest Circular Jobs',
            fontSize: 16,
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: Padding(
          padding: paddingH10V5,
          child: ListView(
            shrinkWrap: true,
            primary: false,
            children: [
              LatestJobCircularComponent(),
              InkWell(
                onTap: () {
                  jobC.getMoreLatestCircularJob();
                },
                child: customCard(
                  width: 100,
                  borderRadius: BorderRadius.circular(30),
                  color: blue,
                  borderColor: red,
                  child: Padding(
                    padding: paddingH10V5,
                    child: Center(
                      child: KText(
                        text: 'Load More',
                        fontSize: 16,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
