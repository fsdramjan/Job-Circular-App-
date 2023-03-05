import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:job_circular_app/model/category/categoryModel.dart';
import 'package:job_circular_app/model/jobs/jobsModel.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

import '../../../service/configs/appColors.dart';
import '../../../service/configs/appUtils.dart';
import '../../../service/controllerService.dart';
import '../../../service/datetime/datetimeFormat.dart';
import '../../pages/job/jobDetailsPage.dart';
import '../../widgets/card/customCard.dart';

class JobListComponent extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: jobC.getAllJobs(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: snapshot.data!.size,
              itemBuilder: (c, i) {
                final item = snapshot.data!.docs[i];
                return customCard(
                  onTap: () => Get.to(
                    JobDetailsPage(
                      images: item['images'],
                      item: JobsModel(
                        id: item['id'],
                        name: item['name'],
                        time: item['time'],
                        applylink: item['applylink'],
                        deadline: item['deadline'],
                        description: item['description'],
                        examDate: item['examDate'],
                        numberOfpost: item['numberOfpost'],
                      ),
                    ),
                  ),
                  borderRadiusC: 5,
                  child: Padding(
                    padding: paddingAll10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: KText(
                                text: item['name'],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // sizeW10,
                            iconButton(
                              icons: Icons.bookmark_outline,
                              iconSize: 20,
                              iconColor: green,
                            ),
                          ],
                        ),
                        sizeH5,
                        Row(
                          children: [
                            KText(
                              text: 'Deadline: ${datetimeFormat(item['time'])}',
                              color: red,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                            sizeW20,
                            KText(
                              text: 'পদ সংখ্যা: ${item['numberOfpost']}',
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
    // customCard(
    //   onTap: () => Get.to(JobDetailsPage()),
    //   borderRadiusC: 5,
    //   child: Padding(
    //     padding: paddingAll10,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           children: [
    //             Expanded(
    //               child: KText(
    //                 text:
    //                    jobsModel.name,
    //                 fontWeight: FontWeight.w600,
    //               ),
    //             ),
    //             // sizeW10,
    //             iconButton(
    //               icons: Icons.bookmark_outline,
    //               iconSize: 20,
    //               iconColor: green,
    //             ),
    //           ],
    //         ),
    //         sizeH5,
    //         Row(
    //           children: [
    //             KText(
    //               text: 'Deadline: 7 Mar 2023',
    //               color: red,
    //               fontSize: 12,
    //               fontStyle: FontStyle.italic,
    //             ),
    //             sizeW20,
    //             KText(
    //               text: 'পদ সংখ্যা: 21',
    //               fontSize: 14,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
