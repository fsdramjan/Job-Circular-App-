import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/view/widgets/ads/ads.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/detailsPageCard/detailsPageCard.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

import '../../../../model/otherPost/otherPostModel.dart';
import '../../../../service/configs/appColors.dart';
import '../../../../service/datetime/datetimeFormat.dart';
import '../../../components/drawer/sidebarComponent.dart';
import '../../../widgets/appBar/cAppBar.dart';


class OtherCategoryPostDetailsPage extends StatelessWidget {
  final OtherPostModel item;

  OtherCategoryPostDetailsPage({
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebarComponent(),
      appBar: cAppBar(
        title: item.name.toString().capitalizeFirst,
      ),
      backgroundColor: grey.shade200,
      body: ListView(
        children: [
          sizeH10,
          Padding(
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
                          text: item.name,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        sizeH10,
                        sizeH5,
                        item.deadline == ''
                            ? sizeW10
                            : KText(
                                text:
                                    'Deadline: ${datetimeFormat(item.deadline)}',
                              ),
                        sizeH10,
                        KText(
                          text: item.description,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                ),
                sizeH10,
                ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: item.images!.length,
                    itemBuilder: (c, i) {
                      return item.images!.length == 0 || item.images!.isEmpty
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: customCard(
                                // height: 300,
                                width: Get.width,
                                elevation: 0,
                                color: grey.shade300,
                                child: Image.network(
                                  item.images![i],
                                ),
                              ),
                            );
                    }),
                Divider(),
                detailsPageCard(),
                sizeH20,
                // Center(
                //   child: customCard(
                //     onTap: () => Get.to(ApplyJobsPage(
                //       jobId: item.id,
                //       jobName: item.name,
                //     )),
                //     color: blue,
                //     borderRadiusC: 10,
                //     child: Padding(
                //       padding: paddingAll10,
                //       child: KText(
                //         text: 'Apply Now',
                //         fontWeight: FontWeight.bold,
                //         color: white,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          sizeH40,
          sizeH40,
        ],
      ),
      bottomSheet: ads(),
    );
  }
}
