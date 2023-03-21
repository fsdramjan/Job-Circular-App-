import 'package:flutter/material.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/components/job/jobListComponent.dart';

import '../../../../service/configs/appColors.dart';
import '../../../widgets/card/customCard.dart';
import '../../../widgets/text/kText.dart';

class AllJobsPage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'All Jobs',
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
            JobListComponent(),
            InkWell(
              onTap: () {
                jobC.getMoreAllJobs();
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
    );
  }
}
