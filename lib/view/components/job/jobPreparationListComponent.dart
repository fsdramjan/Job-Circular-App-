import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/model/jobs/jobsModel.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';
import '../../../service/configs/appColors.dart';
import '../../../service/configs/appUtils.dart';
import '../../../service/controllerService.dart';
import '../../pages/job/chakriProstutiDetailsPage.dart';
import '../../widgets/card/customCard.dart';

class JobPreparationListComponent extends StatelessWidget with AllController {
  @override
  Widget build(context) {
    return Obx(
      () => StreamBuilder(
          stream: jobC.getJobPreparation(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<DocumentSnapshot> dataList = snapshot.data!.docs;
            if (dataList.length < jobC.perPage.value) {
              jobC.hasMoreData = false;
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
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
                        ChakriProstutiDetailsPage(
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
                            images: item['images'],
                          ),
                        ),
                      ),
                      color: white,
                      borderRadiusC: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: blue,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: paddingAll5,
                                  child: KText(
                                    text: item['name'],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
