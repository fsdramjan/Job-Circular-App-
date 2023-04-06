// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/dialog/dialog.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/pages/profile/staticData/jobProfileData.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/button/rowButtonProfile.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/form/cFormField.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

class EducationPage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    JobProfileData.getPassingYear();
    return Scaffold(
      appBar: cAppBar(title: 'Education'),
      drawer: sidebarComponent(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: paddingAll10,
          child: StreamBuilder(
            stream: jobProfileC.getEducation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var item = snapshot.data!.docs;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  jobProfileC.examination.value.text =
                      item.first['examination'] ?? '';
                  jobProfileC.board.value.text = item.first['board'] ?? '';
                  jobProfileC.roll.value.text = item.first['roll'] ?? '';
                  jobProfileC.registrationNo.value.text =
                      item.first['registrationNo'] ?? '';
                  jobProfileC.result.value.text = item.first['result'] ?? '';
                  jobProfileC.passingYear.value.text =
                      item.first['passingYear'] ?? '';
                  jobProfileC.isNotApplicable.value =
                      item.first['isNotApplicable'] ?? false;
                });

                return ListView(
                  children: [
                    cFormField(
                      height: 45,
                      borderColor: grey.shade300,
                      hintText: 'JSC/Equivalent',
                      fontSize: 20,
                      readOnly: true,
                      contentPadding: paddingH10,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      borderColor: grey.shade300,
                      hintText: 'Examination',
                      controller: jobProfileC.examination.value,
                      fontSize: 14,
                      readOnly: true,
                      suffixIcon: iconButton(
                        onTap: () => examinationList(),
                        icons: Icons.arrow_drop_down,
                      ),
                      contentPadding: paddingH10,
                      isAutoValidateText: true,
                      isRequiredField: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      borderColor: grey.shade300,
                      hintText: 'Board',
                      controller: jobProfileC.board.value,
                      fontSize: 14,
                      readOnly: true,
                      suffixIcon: iconButton(
                        onTap: () => boardList(),
                        icons: Icons.arrow_drop_down,
                      ),
                      contentPadding: paddingH10,
                      isAutoValidateText: true,
                      isRequiredField: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      borderColor: grey.shade300,
                      hintText: 'Roll',
                      controller: jobProfileC.roll.value,
                      fontSize: 14,
                      isAutoValidateText: true,
                      isRequiredField: true,
                      contentPadding: paddingH10,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      borderColor: grey.shade300,
                      controller: jobProfileC.registrationNo.value,
                      hintText: 'Registration No',
                      isAutoValidateText: true,
                      isRequiredField: true,
                      fontSize: 14,
                      contentPadding: paddingH10,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      borderColor: grey.shade300,
                      hintText: 'Result',
                      controller: jobProfileC.result.value,
                      isAutoValidateText: true,
                      isRequiredField: true,
                      fontSize: 14,
                      contentPadding: paddingH10,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      borderColor: grey.shade300,
                      hintText: 'Passing Year',
                      isAutoValidateText: true,
                      isRequiredField: true,
                      fontSize: 14,
                      readOnly: true,
                      controller: jobProfileC.passingYear.value,
                      suffixIcon: iconButton(
                        onTap: () => passingYear(),
                        icons: Icons.arrow_drop_down,
                      ),
                      contentPadding: paddingH10,
                    ),
                    sizeH20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Checkbox(
                            value: jobProfileC.isNotApplicable.value,
                            onChanged: (_) {
                              jobProfileC.isNotApplicable.value = _ as bool;
                            },
                          ),
                        ),
                        KText(
                          text: 'Not Applicable',
                          color: black54,
                        ),
                      ],
                    ),
                    sizeH20,
                    customCard(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          jobProfileC.addEducationInfo();
                        }
                      },
                      color: green,
                      height: 40,
                      borderRadiusC: 5,
                      child: Center(
                        child: KText(
                          text: 'Next',
                          fontSize: 14,
                          color: white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    sizeH40,
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  passingYear() {
    final _ = AllController();
    dialog(
        dialogName: 'Select Passing Year',
        height: Get.height / 1.5,
        child: Padding(
          padding: paddingH20,
          child: ListView(
            shrinkWrap: true,
            primary: false,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: JobProfileData.passingYearList.length,
                  reverse: true,
                  itemBuilder: (c, i) {
                    final item = JobProfileData.passingYearList[i];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: rowButtonProfile(
                        onTap: () {
                          _.jobProfileC.passingYear.value.text =
                              item.toString();

                          Get.back();
                        },
                        leadingText: item.toString(),
                        leadingTextColor: black,
                        rightIcon: _.jobProfileC.passingYear.value.text ==
                                item.toString()
                            ? Icons.check_circle_rounded
                            : null,
                        rightIconColor: green,
                      ),
                    );
                  }),
              sizeH40,
              sizeH40,
              sizeH40,
            ],
          ),
        ));
  }

  boardList() {
    final _ = AllController();
    dialog(
        dialogName: 'Select Board',
        height: Get.height / 1.5,
        child: Padding(
          padding: paddingH20,
          child: ListView(
            shrinkWrap: true,
            primary: false,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: JobProfileData.boardList.length,
                  itemBuilder: (c, i) {
                    final item = JobProfileData.boardList[i];

                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: rowButtonProfile(
                        onTap: () {
                          _.jobProfileC.board.value.text = item.toString();

                          Get.back();
                        },
                        leadingText: item.toString(),
                        leadingTextColor: black,
                        rightIcon:
                            _.jobProfileC.board.value.text == item.toString()
                                ? Icons.check_circle_rounded
                                : null,
                        rightIconColor: green,
                      ),
                    );
                  }),
              sizeH40,
              sizeH40,
              sizeH40,
            ],
          ),
        ));
  }

  examinationList() {
    final _ = AllController();
    dialog(
        dialogName: 'Select Exam',
        height: Get.height / 1.5,
        child: Padding(
          padding: paddingH20,
          child: ListView(
            shrinkWrap: true,
            primary: false,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: JobProfileData.examination.length,
                  itemBuilder: (c, i) {
                    final item = JobProfileData.examination[i];

                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: rowButtonProfile(
                        onTap: () {
                          _.jobProfileC.examination.value.text =
                              item.toString();

                          Get.back();
                        },
                        leadingText: item.toString(),
                        leadingTextColor: black,
                        rightIcon: _.jobProfileC.examination.value.text ==
                                item.toString()
                            ? Icons.check_circle_rounded
                            : null,
                        rightIconColor: green,
                      ),
                    );
                  }),
              sizeH40,
              sizeH40,
              sizeH40,
            ],
          ),
        ));
  }
}
