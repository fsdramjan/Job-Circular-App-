import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

import '../../../service/configs/appColors.dart';
import '../../../service/configs/appUtils.dart';
import '../../pages/job/jobDetailsPage.dart';
import '../../widgets/card/customCard.dart';

class JobListComponent extends StatelessWidget {
  const JobListComponent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return customCard(
      onTap: () => Get.to(JobDetailsPage()),
      borderRadiusC: 5,
      child: Padding(
        padding: paddingAll10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KText(
              text:
                  'ইস্টার্ন ব্যাংক লিঃ এ ফাউচার লিডার প্রোগ্রাম ( সিনিয়র অফিসার ) পদে নিয়োগ বিজ্ঞপ্তি - ০৭/০৩',
              fontWeight: FontWeight.w600,
            ),
            sizeH5,
            KText(
              text: 'Deadline: 7 Mar 2023',
              color: red,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ],
        ),
      ),
    );
  }
}
