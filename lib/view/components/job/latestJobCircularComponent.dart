import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';
import '../../../service/configs/appColors.dart';
import '../../../service/configs/appUtils.dart';
import '../../../service/controllerService.dart';
import '../../pages/job/latestJobCircularDetailsPage.dart';
import '../../widgets/card/customCard.dart';

class LatestJobCircularComponent extends StatelessWidget with AllController {
  @override
  Widget build(context) {
    return Obx(
      () => StreamBuilder(
          stream: jobC.getLatestJobCircular(),
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
                        LatestJobCircularDetailsPage(
                          id: item['id'],
                        ),
                      ),
                      color: white,
                      borderRadiusC: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: blue,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: paddingAll5,
                          child: KText(
                            text: '${i + 1}. ${item['name']}',
                            color: blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
