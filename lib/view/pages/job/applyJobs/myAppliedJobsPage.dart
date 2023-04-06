import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/datetime/datetimeFormat.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/pages/job/jobDetailsPage.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';

import '../../../../service/configs/appColors.dart';
import '../../../../service/configs/appUtils.dart';
import '../../../widgets/card/customCard.dart';
import '../../../widgets/text/kText.dart';

class MyAppliedJobsPage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cAppBar(title: 'My Applied Jobs'),
      drawer: sidebarComponent(),
      body: Padding(
        padding: paddingAll10,
        child: ListView(
          children: [
            StreamBuilder(
              stream: jobC.getMyAppliedJobs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data!.size,
                      itemBuilder: (c, i) {
                        final item = snapshot.data!.docs[i];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: customCard(
                            onTap: () => Get.to(
                              JobDetailsPage(
                                id: item['jobId'],
                              ),
                            ),
                            elevation: 0,
                            color: grey.shade200,
                            borderRadiusC: 5,
                            child: Padding(
                              padding: paddingAll10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  KText(
                                    text: item['jobName']
                                        .toString()
                                        .capitalizeFirst,
                                    color: black,
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: white,
                                        radius: 9,
                                        backgroundImage: NetworkImage(
                                          item['profilePic'],
                                        ),
                                      ),
                                      sizeW10,
                                      KText(
                                        text: item['name'],
                                      ),
                                      // sizeW10,
                                      Spacer(),

                                      customCard(
                                        borderRadiusC: 5,
                                        color: red,
                                        elevation: 0,
                                        child: Padding(
                                          padding: paddingAll5,
                                          child: KText(
                                            text: item['status'],
                                            color: white,
                                          ),
                                        ),
                                      ),
                                      sizeW20,
                                      KText(
                                        text: datetimeFormat(
                                          item['time'],
                                        ),
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
