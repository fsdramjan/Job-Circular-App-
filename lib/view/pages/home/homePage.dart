import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/components/job/jobPreparationListComponent.dart';
import 'package:job_circular_app/view/components/job/latestJobCircularComponent.dart';
import 'package:job_circular_app/view/widgets/ads/ads.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';
import '../../components/drawer/sidebarComponent.dart';
import '../../components/job/jobListComponent.dart';
import '../../widgets/card/customCard.dart';
import '../job/allJobs/allJobsPage.dart';
import '../job/latestCircular/latestCircularJobPage.dart';

class HomePage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebarComponent(),
      appBar: cAppBar(title: 'Job Circular'),
      body: Padding(
        padding: paddingH5,
        child: ListView(
          children: [
            // sizeH10,
            // Row(
            //   children: [
            //     customCard(
            //       onTap: () {},
            //       padding: EdgeInsets.all(5),
            //       color: blue,
            //       borderRadiusC: 5,
            //       height: 40,
            //       child: Center(
            //         child: KText(
            //           text: '  New Circular  ',
            //           color: white,
            //         ),
            //       ),
            //     ),
            //     customCard(
            //       onTap: () {},
            //       padding: EdgeInsets.all(5),
            //       color: blue,
            //       borderRadiusC: 5,
            //       height: 40,
            //       child: Center(
            //         child: KText(
            //           text: '  Deadline Tomorrow/Soon  ',
            //           color: white,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     customCard(
            //       onTap: () {},
            //       padding: EdgeInsets.all(5),
            //       color: blue,
            //       height: 40,
            //       width: Get.width / 1.5,
            //       borderRadiusC: 5,
            //       child: Center(
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Icon(
            //               Icons.mouse,
            //               color: white,
            //               size: 20,
            //             ),
            //             KText(
            //               text: '  Extra Category / Menu  ',
            //               fontSize: 14,
            //               fontWeight: FontWeight.w600,
            //               color: white,
            //             ),
            //             Icon(
            //               Icons.mouse,
            //               color: white,
            //               size: 20,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            sizeH10,
            JobListComponent(),
            sizeH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    // jobC.getMoreAllJobs();
                    Get.to(AllJobsPage());
                  },
                  child: customCard(
                    width: 100,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: blue,
                    borderColor: red,
                    child: Padding(
                      padding: paddingH10,
                      child: KText(
                        text: 'Next Page',
                        fontSize: 16,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sizeH10,
            Padding(
              padding: paddingH10,
              child: Row(
                children: [
                  KText(
                    text: '🆕 Latest Circular 🆕',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            sizeH10,
            Padding(
              padding: paddingH10,
              child: LatestJobCircularComponent(),
            ),
            sizeH10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customCard(
                  onTap: () => Get.to(LatestCircularJobPage()),
                  width: 160,
                  color: white,
                  elevation: 0,
                  borderRadiusC: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: blue,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: paddingAll5,
                      child: KText(
                        text: 'View All Latest Circular',
                        fontWeight: FontWeight.bold,
                        color: blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sizeH20,
            Padding(
              padding: paddingH10,
              child: Row(
                children: [
                  KText(
                    text: '📚 চাকরির প্রস্তুতি 📚',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            sizeH20,
            Padding(
              padding: paddingH10,
              child: JobPreparationListComponent(),
            ),
            sizeH10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customCard(
                  onTap: () => jobC.getMorePreparationJob(),
                  width: 100,
                  color: white,
                  elevation: 0,
                  borderRadiusC: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: blue,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: paddingAll5,
                      child: KText(
                        text: 'Load More...',
                        fontWeight: FontWeight.bold,
                        color: blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            sizeH40,
            sizeH40,
          ],
        ),
      ),
      bottomSheet: ads(),
    );
  }

  // _extraCategoryMenu() {
  //   return CPopupMenuButton(
  //     icon: customCard(
  //       onTap: () {},
  //       padding: EdgeInsets.all(5),
  //       color: blue,
  //       height: 40,
  //       // width: Get.width / 1.5,
  //       borderRadiusC: 5,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Icon(
  //             Icons.mouse,
  //             color: white,
  //             size: 20,
  //           ),
  //           KText(
  //             text: '  Extra Category / Menu  ',
  //             fontSize: 14,
  //             fontWeight: FontWeight.w600,
  //             color: white,
  //           ),
  //           Icon(
  //             Icons.mouse,
  //             color: white,
  //             size: 20,
  //           ),
  //         ],
  //       ),
  //     ),
  //     items: extraCategoryList
  //         .map((e) => PopupMenuItem(
  //               value: e['value'] as int,
  //               child: KText(
  //                 text: e['title'].toString(),
  //               ),
  //             ))
  //         .toList(),
  //     onSelected: (v) {},
  //   );
  // }
}
