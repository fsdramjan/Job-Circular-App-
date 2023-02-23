import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/widgets/ads/ads.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

class LatestJobCircularDetailsPage extends StatelessWidget {
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
                  child: Padding(
                    padding: paddingAll10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text:
                              'ইস্টার্ন ব্যাংক লিঃ এ ফাউচার লিডার প্রোগ্রাম ( সিনিয়র অফিসার ) পদে নিয়োগ বিজ্ঞপ্তি - ০৭/০৩',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        sizeH10,
                        KText(
                          text: 'পরীক্ষার তারিখ: ২৪ ফেব্রুয়ারী ২০২৩',
                        ),
                        Divider(),
                        KText(
                          text:
                              'আগামী ২৪/০২/২০২৩ ইং তারিখে অনুষ্ঠিতব্য কতৃপক্ষের কারিগরি পুলের বিভিন্ন পদে নিয়োগের নিমিত্ত প্রাথীদের লিখিত পরীক্ষার আসন বিন্যাস',
                        ),
                      ],
                    ),
                  ),
                ),
                sizeH10,
                customCard(
                  height: 300,
                  width: Get.width,
                  elevation: 0,
                  color: grey.shade300,
                  child: FlutterLogo(),
                ),
                sizeH10,
                customCard(
                  height: 300,
                  width: Get.width,
                  elevation: 0,
                  color: grey.shade300,
                  child: FlutterLogo(),
                ),
                Divider(),
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
