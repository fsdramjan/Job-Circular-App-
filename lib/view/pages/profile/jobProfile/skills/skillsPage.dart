import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/form/cFormField.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

import '../../model/skillsModel.dart';
import 'skillsExperiencePage.dart';

class SkillsPage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cAppBar(title: 'Skills'),
      drawer: sidebarComponent(),
      body: Padding(
        padding: paddingAll10,
        child: ListView(
          children: [
            sizeH10,
            Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: jobProfileC.skillsList.length == 0
                      ? 1
                      : jobProfileC.skillsList.length,
                  itemBuilder: (c, i) {
                    return skillAddUi(
                      computerLiteracy: jobProfileC.computerLiteracy,
                      institutionName: jobProfileC.institutionName,
                      duration: jobProfileC.duration,
                      result: jobProfileC.resultSkills,
                    );
                  }),
            ),
            // sizeH20,
            // customCard(
            //   borderRadiusC: 5,
            //   color: grey.shade50,
            //   elevation: .2,
            //   height: 40,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         color: grey.shade300,
            //       ),
            //       color: white,
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     child: Padding(
            //       padding: paddingAll5,
            //       child: Row(
            //         children: [
            //           KText(
            //             text: 'Add More',
            //             color: Colors.green,
            //             fontWeight: FontWeight.w600,
            //           ),
            //           sizeW10,
            //           KText(
            //             text: '( If Applicable )',
            //             color: black54,
            //             fontWeight: FontWeight.w600,
            //           ),
            //           Spacer(),
            //           iconButton(
            //             onTap: () {
            //               jobProfileC.skillsList.add(
            //                 SkillsModel(
            //                   computerLiteracy:
            //                       jobProfileC.computerLiteracy.text,
            //                   institutionName: jobProfileC.institutionName.text,
            //                   duration: jobProfileC.duration.text,
            //                   result: jobProfileC.resultSkills.text,
            //                 ),
            //               );
            //             },
            //             icons: Icons.add_circle_outlined,
            //             iconSize: 17,
            //             iconColor: green,
            //             isHideCirleAvatar: true,
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            sizeH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Checkbox(
                    value: jobProfileC.isIDonthaveAny.value,
                    onChanged: (_) {
                      jobProfileC.isIDonthaveAny.value = _ as bool;
                    },
                  ),
                ),
                KText(
                  text: '''I don't have any''',
                  color: black54,
                ),
              ],
            ),
            sizeH20,
            customCard(
              onTap: () => Get.to(SkillsExperiencePage()),
              color: green,
              height: 40,
              borderRadiusC: 5,
              child: Center(
                child: KText(
                  text: 'Next',
                  fontSize: 16,
                  color: white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            sizeH40,
          ],
        ),
      ),
    );
  }

  Widget skillAddUi({
    required TextEditingController computerLiteracy,
    required TextEditingController institutionName,
    required TextEditingController duration,
    required TextEditingController result,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cFormField(
            height: 45,
            borderColor: grey.shade300,
            hintText: 'Computer Literacy',
            fontSize: 16,
            contentPadding: paddingH10,
          ),
          sizeH10,
          cFormField(
            height: 45,
            borderColor: grey.shade300,
            hintText: 'Institution Name',
            fontSize: 16,
            contentPadding: paddingH10,
          ),
          sizeH10,
          cFormField(
            height: 45,
            borderColor: grey.shade300,
            hintText: 'Duration',
            fontSize: 16,
            contentPadding: paddingH10,
          ),
          sizeH10,
          cFormField(
            height: 45,
            borderColor: grey.shade300,
            hintText: 'Result',
            fontSize: 16,
            contentPadding: paddingH10,
          ),
        ],
      ),
    );
  }
}
