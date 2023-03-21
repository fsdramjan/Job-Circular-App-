import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/model/jobs/jobsModel.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

import '../../../service/configs/appColors.dart';
import '../../../service/configs/appUtils.dart';
import '../../../service/controllerService.dart';
import '../../../service/datetime/datetimeFormat.dart';
import '../../pages/job/jobDetailsPage.dart';
import '../../widgets/card/customCard.dart';

class CategorywiseJobComponent extends StatelessWidget with AllController {
  final String? categoryId;
  CategorywiseJobComponent({
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => StreamBuilder(
          stream: jobC.categoryWiseJob(categoryId),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: KText(text: 'There is no data!!'),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<DocumentSnapshot> dataList = snapshot.data!.docs;
            if (dataList.length < jobC.perPage.value) {
              jobC.hasMoreData = false;
            }
            print(snapshot.connectionState);
            print(dataList.length);
            return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: dataList.length + (jobC.hasMoreData ? 1 : 0),
                // itemCount: snapshot.data!.size,
                itemBuilder: (c, i) {
                  if (i == dataList.length) {
                    return Center(
                        // child: CircularProgressIndicator(),
                        );
                  }

                  DocumentSnapshot item = dataList[i];
                  // final item = snapshot.data!.docs[i];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: customCard(
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
                            isJobCircular: item['isJobCircular'],
                            isJobPreparation: item['isJobPreparation'],
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
                                  text:
                                      'Deadline: ${datetimeFormat(item['time'])}',
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
                    ),
                  );
                });
          }),
    );
  }
}
