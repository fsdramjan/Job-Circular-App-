// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../staticData/jobProfileData.dart';

class BasicInfoPage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cAppBar(title: 'Basic Info'),
      drawer: sidebarComponent(),
      body: Padding(
        padding: paddingAll10,
        child: Form(
          key: formKey,
          child: StreamBuilder(
            stream: jobProfileC.getBasicInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var item = snapshot.data!.docs;

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  jobProfileC.fullName.text = item.first['fullName'] ?? '';
                  jobProfileC.fatherName.text = item.first['fatherName'] ?? '';
                  jobProfileC.motherName.text = item.first['motherName'] ?? '';
                  jobProfileC.dateOfBirth.text =
                      item.first['dateOfBirth'] ?? '';

                  var date = DateTime.parse(item.first['dateOfBirth']);
                  jobProfileC.dob.text =
                      '${date.day}/${date.month}/${date.year}';
                  jobProfileC.gender.value.text = item.first['gender'] ?? '';
                  jobProfileC.feetH.text = item.first['feetH'] ?? '';
                  jobProfileC.inchesH.text = item.first['inchesH'] ?? '';
                  jobProfileC.religion.value.text =
                      item.first['religion'] ?? '';
                  jobProfileC.martialStatus.value.text =
                      item.first['martialStatus'] ?? '';
                  jobProfileC.nationalIdNo.text =
                      item.first['nationalIdNo'] ?? '';
                  jobProfileC.passportNo.text = item.first['passportNo'] ?? '';
                  jobProfileC.mobileNumber.text = item.first['mobileNo'] ?? '';
                  jobProfileC.confirmMobileNumber.text =
                      item.first['confirmMobileNumber'] ?? '';
                  jobProfileC.email.text = item.first['email'] ?? '';
                  jobProfileC.quota.value.text = item.first['quota'] ?? '';
                });

                return ListView(
                  children: [
                    cFormField(
                      height: 0,
                      controller: jobProfileC.fullName,
                      borderColor: grey.shade300,
                      hintText: 'Full Name',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      isRequiredField: true,
                      isAutoValidateText: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.fatherName,
                      borderColor: grey.shade300,
                      hintText: '''Father's Name''',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      isRequiredField: true,
                      isAutoValidateText: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.motherName,
                      borderColor: grey.shade300,
                      hintText: '''Mother's Name''',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      isRequiredField: true,
                      isAutoValidateText: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.dob,
                      borderColor: grey.shade300,
                      hintText: '''Date of Birth''',
                      isRequiredField: true,
                      isAutoValidateText: true,
                      fontSize: 14,
                      contentPadding: paddingH10,
                      readOnly: true,
                      suffixIcon: iconButton(
                        onTap: () => dateOfBirth(context),
                        icons: Icons.arrow_drop_down,
                      ),
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.gender.value,
                      borderColor: grey.shade300,
                      hintText: 'Gender',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      isRequiredField: true,
                      isAutoValidateText: true,
                      readOnly: true,
                      suffixIcon: iconButton(
                        onTap: () => genderlist(),
                        icons: Icons.arrow_drop_down,
                      ),
                    ),
                    sizeH10,
                    Row(
                      children: [
                        KText(
                          text: 'Height:',
                          color: black54,
                        ),
                        sizeW20,
                        Expanded(
                          child: cFormField(
                            height: 0,
                            controller: jobProfileC.feetH,
                            borderColor: grey.shade300,
                            hintText: 'Feet',
                            fontSize: 14,
                            contentPadding: paddingH10,
                            isRequiredField: true,
                            isAutoValidateText: true,
                          ),
                        ),
                        sizeW20,
                        Expanded(
                          child: cFormField(
                            height: 0,
                            controller: jobProfileC.inchesH,
                            borderColor: grey.shade300,
                            hintText: 'Inches',
                            fontSize: 14,
                            contentPadding: paddingH10,
                            isRequiredField: true,
                            isAutoValidateText: true,
                          ),
                        ),
                      ],
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.religion.value,
                      borderColor: grey.shade300,
                      hintText: 'Religion',
                      fontSize: 14,
                      readOnly: true,
                      suffixIcon: iconButton(
                        onTap: () => religionList(),
                        icons: Icons.arrow_drop_down,
                      ),
                      contentPadding: paddingH10,
                      isRequiredField: true,
                      isAutoValidateText: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.martialStatus.value,
                      borderColor: grey.shade300,
                      hintText: 'Martial Status',
                      fontSize: 14,
                      readOnly: true,
                      suffixIcon: iconButton(
                        onTap: () => martialStatusList(),
                        icons: Icons.arrow_drop_down,
                      ),
                      contentPadding: paddingH10,
                      isRequiredField: true,
                      isAutoValidateText: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.nationalIdNo,
                      borderColor: grey.shade300,
                      hintText: 'National ID No',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      isRequiredField: true,
                      isAutoValidateText: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.passportNo,
                      borderColor: grey.shade300,
                      hintText: 'Passport No',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      isRequiredField: true,
                      isAutoValidateText: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.mobileNumber,
                      borderColor: grey.shade300,
                      hintText: 'Mobile Number',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      isRequiredField: true,
                      isAutoValidateText: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.confirmMobileNumber,
                      borderColor: grey.shade300,
                      hintText: 'Confirm Mobile Number',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      isRequiredField: true,
                      isAutoValidateText: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.email,
                      borderColor: grey.shade300,
                      hintText: 'Email',
                      fontSize: 14,
                      contentPadding: paddingH10,
                      isRequiredField: true,
                      isAutoValidateText: true,
                    ),
                    sizeH10,
                    cFormField(
                      height: 0,
                      controller: jobProfileC.quota.value,
                      borderColor: grey.shade300,
                      hintText: 'Quota',
                      fontSize: 14,
                      readOnly: true,
                      suffixIcon: iconButton(
                        onTap: () => quotaList(),
                        icons: Icons.arrow_drop_down,
                      ),
                      contentPadding: paddingH10,
                      isRequiredField: true,
                      isAutoValidateText: true,
                    ),
                    sizeH20,
                    customCard(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          jobProfileC.addBasicInfo();
                        } else {}
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

  dateOfBirth(context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1940),
      maxTime: DateTime(2050),
      theme: DatePickerTheme(
        backgroundColor: white,
        headerColor: green,
        itemStyle: GoogleFonts.hindSiliguri(
          color: black,
          fontWeight: FontWeight.w600,
        ),
        doneStyle: GoogleFonts.hindSiliguri(
          color: white,
          fontWeight: FontWeight.bold,
        ),
        cancelStyle: GoogleFonts.hindSiliguri(
          color: white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onChanged: (date) {
        debugPrint('change $date');
        jobProfileC.dateOfBirth.text = date.toString();
        jobProfileC.dob.text = '${date.day}/${date.month}/${date.year}';
      },
      onConfirm: (date) {
        debugPrint('confirm $date');
        jobProfileC.dateOfBirth.text = date.toString();
        jobProfileC.dob.text = '${date.day}/${date.month}/${date.year}';
      },
      currentTime: DateTime.now(),
    );
  }

  genderlist() {
    dialog(
      dialogName: 'Select Gender',
      height: Get.height / 2.5,
      child: Padding(
        padding: paddingH20,
        child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: JobProfileData.genderList.length,
            itemBuilder: (c, i) {
              final item = JobProfileData.genderList[i];
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: rowButtonProfile(
                  onTap: () {
                    jobProfileC.gender.value.text = item;
                    Get.back();
                  },
                  leadingText: item,
                  rightIcon: jobProfileC.gender.value.text == item
                      ? Icons.check_circle_rounded
                      : null,
                  rightIconColor: green,
                ),
              );
            }),
      ),
    );
  }

  religionList() {
    dialog(
      dialogName: 'Select Religion',
      height: Get.height / 2.5,
      child: Padding(
        padding: paddingH20,
        child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: JobProfileData.religionList.length,
            itemBuilder: (c, i) {
              final item = JobProfileData.religionList[i];
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: rowButtonProfile(
                  onTap: () {
                    jobProfileC.religion.value.text = item;
                    Get.back();
                  },
                  leadingText: item,
                  rightIcon: jobProfileC.religion.value.text == item
                      ? Icons.check_circle_rounded
                      : null,
                  rightIconColor: green,
                ),
              );
            }),
      ),
    );
  }

  quotaList() {
    dialog(
      dialogName: 'Select Quota',
      height: Get.height / 1.5,
      child: Padding(
        padding: paddingH20,
        child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: JobProfileData.quotaList.length,
            itemBuilder: (c, i) {
              final item = JobProfileData.quotaList[i];
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: rowButtonProfile(
                  onTap: () {
                    jobProfileC.quota.value.text = item;
                    Get.back();
                  },
                  leadingText: item,
                  rightIcon: jobProfileC.quota.value.text == item
                      ? Icons.check_circle_rounded
                      : null,
                  rightIconColor: green,
                ),
              );
            }),
      ),
    );
  }

  martialStatusList() {
    dialog(
      dialogName: 'Select Marital Status',
      height: Get.height / 2.5,
      child: Padding(
        padding: paddingH20,
        child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: JobProfileData.martialStatus.length,
            itemBuilder: (c, i) {
              final item = JobProfileData.martialStatus[i];
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: rowButtonProfile(
                  onTap: () {
                    jobProfileC.martialStatus.value.text = item;
                    Get.back();
                  },
                  leadingText: item,
                  rightIcon: jobProfileC.martialStatus.value.text == item
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
