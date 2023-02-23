import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/view/widgets/ads/ads.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import 'package:job_circular_app/view/widgets/popupMenu/cPopupMenuButton.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';
import '../../components/drawer/sidebarComponent.dart';
import '../../components/job/jobListComponent.dart';
import '../../widgets/card/customCard.dart';
import '../job/chakriProstutiDetailsPage.dart';
import '../job/latestJobCircularDetailsPage.dart';

class HomePage extends StatelessWidget {
  final extraCategoryList = [
    {
      'value': 1,
      'title': 'Job Preparation',
    },
    {
      'value': 2,
      'title': 'Trending Job Question',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebarComponent(),
      appBar: cAppBar(title: 'Job Circular'),
      body: Padding(
        padding: paddingH5,
        child: ListView(
          children: [
            sizeH10,
            Row(
              children: [
                customCard(
                  onTap: () {},
                  padding: EdgeInsets.all(5),
                  color: blue,
                  borderRadiusC: 5,
                  height: 40,
                  child: Center(
                    child: KText(
                      text: '  New Circular  ',
                      color: white,
                    ),
                  ),
                ),
                customCard(
                  onTap: () {},
                  padding: EdgeInsets.all(5),
                  color: blue,
                  borderRadiusC: 5,
                  height: 40,
                  child: Center(
                    child: KText(
                      text: '  Deadline Tomorrow/Soon  ',
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customCard(
                  onTap: () {},
                  padding: EdgeInsets.all(5),
                  color: blue,
                  height: 40,
                  width: Get.width / 1.5,
                  borderRadiusC: 5,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mouse,
                          color: white,
                          size: 20,
                        ),
                        KText(
                          text: '  Extra Category / Menu  ',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                        Icon(
                          Icons.mouse,
                          color: white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            sizeH10,
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: JobListComponent(),
                  );
                }),
            sizeH10,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    print('object');
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
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 5,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: customCard(
                      onTap: () => Get.to(LatestJobCircularDetailsPage()),
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
                            text:
                                '${i + 1}. ইস্টার্ন ব্যাংক লিঃ এ ফাউচার লিডার প্রোগ্রাম ( সিনিয়র অফিসার ) পদে নিয়োগ বিজ্ঞপ্তি - ০৭/০৩',
                            color: blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            sizeH10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customCard(
                  onTap: () {},
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
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 5,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: customCard(
                      onTap: () => Get.to(ChakriProstutiDetailsPage()),
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
                            text:
                                'ইস্টার্ন ব্যাংক লিঃ এ ফাউচার লিডার প্রোগ্রাম ( সিনিয়র অফিসার ) পদে নিয়োগ বিজ্ঞপ্তি - ০৭/০৩',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            sizeH10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customCard(
                  onTap: () {},
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
