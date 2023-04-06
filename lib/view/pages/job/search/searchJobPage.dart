// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/pages/job/jobDetailsPage.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/form/cFormField.dart';
import '../../../../model/jobs/jobsModel.dart';
import '../../../../model/wishlist/wishItemType.dart';
import '../../../../model/wishlist/wishlistModel.dart';
import '../../../../service/configs/appColors.dart';
import '../../../../service/configs/appUtils.dart';
import '../../../../service/datetime/datetimeFormat.dart';
import '../../../widgets/card/customCard.dart';
import '../../../widgets/text/kText.dart';

class SearchJobPage extends StatelessWidget with AllController {
  var jobList = RxList<JobsModel>();

  @override
  Widget build(BuildContext context) {
    jobC.searchJob().then((_) {
      jobList.value = _;
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Obx(
          () => cFormField(
            style: TextStyle(
              fontSize: 16,
            ),
            height: 45,
            hintText: 'Search job...',
            controller: jobC.searchText.value,
            onChanged: (_) {
              jobC.searchJob().then((_) {
                jobList.value = _;
              });
            },
            suffixIcon: jobC.searchText.value.text.isEmpty
                ? null
                : iconButton(
                    onTap: () => jobC.searchText.value.clear(),
                    icons: Icons.close,
                    iconSize: 15,
                  ),
          ),
        ),
      ),
      body: Padding(
        padding: paddingAll10,
        child: Obx(
          () => ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: jobList.length,
              itemBuilder: (c, i) {
                final item = jobList[i];
                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: customCard(
                    onTap: () => Get.to(
                      JobDetailsPage(
                        id: item.id,
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
                                  text: item.name,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // sizeW10,
                              iconButton(
                                onTap: () =>
                                    wishlistC.addWishlist(WishlistModel(
                                  id: item.id,
                                  name: item.name,
                                  description: item.description,
                                  numberOfPost: item.numberOfpost,
                                  deadline: item.deadline,
                                  wishItemType: WishItemType.jobCategory,
                                )),
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
                                text: 'Deadline: ${datetimeFormat(item.time)}',
                                color: red,
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                              sizeW20,
                              KText(
                                text: 'পদ সংখ্যা: ${item.numberOfpost}',
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
