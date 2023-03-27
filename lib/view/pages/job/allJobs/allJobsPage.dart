import 'package:flutter/material.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/components/job/jobListComponent.dart';
import 'package:job_circular_app/view/widgets/button/loadmoreButton.dart';
import '../../../../service/configs/appColors.dart';
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
            loadmoreButton(
              onTap: () {
                jobC.getMoreAllJobs();
              },
            ),
          ],
        ),
      ),
    );
  }
}
