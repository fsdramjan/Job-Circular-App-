import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/model/jobs/jobsModel.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/datetime/datetimeFormat.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/widgets/ads/ads.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

class ChakriProstutiDetailsPage extends StatelessWidget {
  final JobsModel item;

  ChakriProstutiDetailsPage({
    required this.item,
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
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        sizeH10,
                        KText(
                          text:
                              'পরীক্ষার তারিখ: ${datetimeFormat(item.examDate)}',
                        ),
                        sizeH10,
                        KText(
                          text: item.description,
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
                      return customCard(
                        height: 300,
                        width: Get.width,
                        elevation: 0,
                        color: grey.shade300,
                        child: Image.network(item.images![i]),
                      );
                    }),
                sizeH10,
                Divider(),
                customCard(
                  elevation: 0,
                  color: white,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: paddingAll10,
                      child: KText(
                        text:
                            '''পরীক্ষার প্রস্তুতির জন্য বিভিন্ন পিডিএফ এবং অনন্যা বিষয়ে আপডেট থাকতে আমাদের ফেসবুক গ্রুপে যোগ দিন -
fb.com/groups/quicktechitltd
অথবা ফেইসবুক পেজে লাইক দিন -
fb.com/quicktechitltd
ওয়েবসাইট: www.quicktechitltd.com''',
                      ),
                    ),
                  ),
                ),
                sizeH20,
                Center(
                  child: customCard(
                    onTap: () {},
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
          ),
          sizeH40,
          sizeH40,
        ],
      ),
      bottomSheet: ads(),
    );
  }
}
