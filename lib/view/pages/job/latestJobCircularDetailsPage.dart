import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/datetime/datetimeFormat.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/pages/job/applyJobs/applyJobsPage.dart';
import 'package:job_circular_app/view/widgets/ads/ads.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

class LatestJobCircularDetailsPage extends StatelessWidget with AllController {
  final String? id;

  LatestJobCircularDetailsPage({
    required this.id,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebarComponent(),
      appBar: cAppBar(title: 'Job Details'),
      backgroundColor: grey.shade200,
      body: ListView(
        children: [
          sizeH10,
          StreamBuilder(
            stream: jobC.getSingleJobs(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.size,
                    itemBuilder: (c, i) {
                      final item = snapshot.data!.docs[i];
                      return Padding(
                        padding: paddingH10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customCard(
                              color: white,
                              elevation: 0,
                              width: Get.width,
                              child: Padding(
                                padding: paddingAll10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    KText(
                                      text: item['name'],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    sizeH10,
                                    KText(
                                      text:
                                          'পরীক্ষার তারিখ: ${datetimeFormat(item['examDate'])}',
                                    ),
                                    Divider(),
                                    KText(
                                      text: item['description'],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            sizeH10,
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: item['images'].length,
                              itemBuilder: (c, i) {
                                return customCard(
                                  height: 300,
                                  width: Get.width,
                                  elevation: 0,
                                  color: grey.shade300,
                                  child: Image.network(
                                    item['images'][i],
                                  ),
                                );
                              },
                            ),
                            Divider(),
                            Center(
                              child: customCard(
                                onTap: () => Get.to(ApplyJobsPage(
                                  jobId: id,
                                  jobName: item['name'],
                                )),
                                color: blue,
                                borderRadiusC: 10,
                                child: Padding(
                                  padding: paddingAll10,
                                  child: KText(
                                    text: 'Apply Now',
                                    fontWeight: FontWeight.bold,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
          sizeH40,
          sizeH40,
        ],
      ),
      bottomSheet: ads(),
    );
  }
}
