import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/dialog/dialog.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/button/rowButtonProfile.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/form/cFormField.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';
import '../../staticData/jobProfileData.dart';

class SkillsExperiencePage extends StatefulWidget {
  @override
  State<SkillsExperiencePage> createState() => _SkillsExperiencePageState();
}

class _SkillsExperiencePageState extends State<SkillsExperiencePage>
    with AllController {
  var date = DateTime.now();

  Future<void> selectStartDate(BuildContext context, {int type = 0}) async {
    final DateTime? picked = await showDatePicker(
        cancelText: 'Cancel'.tr,
        confirmText: 'Submit'.tr,
        context: context,
        initialDate: date,
        firstDate: DateTime(2022),
        lastDate: DateTime(2101));
    setState(() {
      date = picked ?? date;
      if (type == 0) {
        jobProfileC.startDate.text =
            '${date.day}-${(date.month.toString().length == 1 ? '0' + date.month.toString() : date.month)}-${date.year}';
      } else {
        jobProfileC.endDate.text =
            '${date.day}-${(date.month.toString().length == 1 ? '0' + date.month.toString() : date.month)}-${date.year}';
      }

      // jobsC.selectedDeadline.value = date.toString();
      // jobsC.deadline.text = datetimeFormat(date).toString();
    });
  }

  @override
  void initState() {
    jobProfileC.startDate.text =
        '${date.day}-${(date.month.toString().length == 1 ? '0' + date.month.toString() : date.month)}-${date.year}';
    jobProfileC.endDate.text =
        '${date.day}-${(date.month.toString().length == 1 ? '0' + date.month.toString() : date.month)}-${date.year}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cAppBar(title: 'Experience'),
      drawer: sidebarComponent(),
      body: Padding(
        padding: paddingAll10,
        child: ListView(
          children: [
            sizeH10,
            skillAddUi(),
            sizeH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Checkbox(
                    value: jobProfileC.iCurrentlyWorkInThisRole.value,
                    onChanged: (_) {
                      jobProfileC.iCurrentlyWorkInThisRole.value = _ as bool;
                    },
                  ),
                ),
                KText(
                  text: '''I currently work in this role''',
                  color: black54,
                ),
              ],
            ),
            sizeH20,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => selectStartDate(context, type: 0),
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: paddingAll5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: 'Start Date',
                          fontSize: 14,
                          color: black54,
                        ),
                        KText(
                          text: jobProfileC.startDate.text,
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ),
                sizeW20,
                sizeW20,
                Obx(
                  () => jobProfileC.iCurrentlyWorkInThisRole.value == true
                      ? KText(text: 'Present')
                      : InkWell(
                          onTap: () => selectStartDate(context, type: 1),
                          borderRadius: BorderRadius.circular(5),
                          child: Padding(
                            padding: paddingAll5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KText(
                                  text: 'End Date',
                                  fontSize: 14,
                                  color: black54,
                                ),
                                KText(
                                  text: jobProfileC.endDate.text,
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
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
              onTap: () => jobProfileC.addSkillsInfo(),
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

  Widget skillAddUi() {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizeH10,
          cFormField(
            height: 45,
            borderColor: grey.shade300,
            hintText: 'Private/Public',
            fontSize: 14,
            controller: jobProfileC.jobType,
            contentPadding: paddingH10,
            readOnly: true,
            suffixIcon: iconButton(
              onTap: () => jobType(),
              icons: Icons.arrow_drop_down,
            ),
          ),
          sizeH10,
          cFormField(
            height: 45,
            controller: jobProfileC.companyName,
            borderColor: grey.shade300,
            hintText: 'Company Name',
            fontSize: 16,
            contentPadding: paddingH10,
          ),
          sizeH10,
          cFormField(
            height: 45,
            controller: jobProfileC.location,
            borderColor: grey.shade300,
            hintText: 'Location',
            fontSize: 16,
            contentPadding: paddingH10,
          ),
          sizeH10,
          cFormField(
            height: 45,
            controller: jobProfileC.designation,
            borderColor: grey.shade300,
            hintText: 'Designation',
            fontSize: 16,
            contentPadding: paddingH10,
          ),
          sizeH10,
          cFormField(
            height: 45,
            controller: jobProfileC.presentSalary,
            borderColor: grey.shade300,
            hintText: 'Present Salary',
            fontSize: 16,
            contentPadding: paddingH10,
          ),
        ],
      ),
    );
  }

  jobType() {
    dialog(
      dialogName: 'Select Item',
      height: Get.height / 3,
      child: Padding(
        padding: paddingH20,
        child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: JobProfileData.jobType.length,
            itemBuilder: (c, i) {
              final item = JobProfileData.jobType[i];
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: rowButtonProfile(
                  onTap: () {
                    jobProfileC.jobType.text = item;
                    Get.back();
                  },
                  leadingText: item,
                  leadingTextColor: black,
                  rightIcon: jobProfileC.jobType.text == item
                      ? Icons.check_circle_rounded
                      : null,
                  rightIconColor: green,
                ),
              );
            }),
      ),
    );
  }
}
