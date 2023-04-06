import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/snackbar/snackbar.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';

import '../../../../service/configs/appColors.dart';
import '../../../widgets/card/customCard.dart';
import '../../../widgets/form/cFormField.dart';
import '../../../widgets/text/kText.dart';

class ApplyJobsPage extends StatelessWidget with AllController {
  final String? jobId;
  final String? jobName;

  ApplyJobsPage({
    required this.jobId,
    required this.jobName,
  });
  @override
  Widget build(BuildContext context) {
    authC.getProfileInfo().then((_) {
      _.map((e) {
        fileUploadC.selectedImage.value = e.image ?? '';
        authC.name.value.text = e.name ?? '';
        authC.email.value.text = e.email ?? '';
        authC.phoneController.text = e.phone ?? '';
      }).toList();
    });
    return Scaffold(
      appBar: cAppBar(title: 'Apply Jobs'),
      drawer: sidebarComponent(),
      body: Padding(
        padding: paddingAll10,
        child: ListView(
          children: [
            KText(
              text: 'Name',
            ),
            sizeH10,
            cFormField(
              height: 45,
              borderColor: grey,
              controller: authC.name.value,
              hintText: 'Enter your name',
              fontSize: 16,
              contentPadding: paddingH10,
            ),
            sizeH10,
            KText(
              text: 'Email',
            ),
            sizeH10,
            cFormField(
              height: 45,
              borderColor: grey,
              controller: authC.email.value,
              hintText: 'Enter your email',
              fontSize: 16,
              contentPadding: paddingH10,
            ),
            sizeH10,
            KText(
              text: 'Phone',
            ),
            sizeH10,
            cFormField(
              height: 45,
              borderColor: grey,
              controller: authC.phoneController,
              hintText: 'Enter your phone',
              fontSize: 16,
              contentPadding: paddingH10,
            ),
            sizeH10,
            KText(
              text: 'Description ',
            ),
            sizeH10,
            cFormField(
              height: 0,
              borderColor: grey,
              controller: jobC.descriptionText.value,
              hintText: 'Enter your description',
              fontSize: 16,
              maxLines: 3,
              minLines: 3,
              contentPadding: paddingH10,
            ),
            sizeH10,
            customCard(
              onTap: () => fileUploadC.pickFile(
                uploadCategory: 'Cv',
                extensions: ['pdf'],
              ),
              borderRadiusC: 5,
              child: Obx(
                () => Container(
                  height: 120,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: fileUploadC.selectedFile.value != ''
                        ? [
                            Icon(
                              Icons.picture_as_pdf,
                              size: 50,
                              color: red,
                            ),
                            KText(
                              text: '[${fileUploadC.selectedFileName.value}]',
                              color: black54,
                            ),
                          ]
                        : [
                            Icon(
                              Icons.add,
                              color: black54,
                              size: 30,
                            ),
                            KText(
                              text: 'Add File',
                              color: black54,
                            ),
                            sizeH5,
                            KText(
                              text: '[only .pdf format accepted.]',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: black54,
                            ),
                          ],
                  ),
                ),
              ),
            ),
            sizeH20,
            Center(
              child: customCard(
                onTap: () {
                  if (authC.name.value.text.isEmpty ||
                      authC.email.value.text.isEmpty ||
                      authC.phoneController.text.isEmpty ||
                      jobC.descriptionText.value.text.isEmpty) {
                    snackbar('Field Empty!!', bgColor: red);
                  } else {
                    if (fileUploadC.selectedFile.value == '') {
                      snackbar('Attach a file!!', bgColor: red);
                    } else {
                      jobC.applyForJob(jobId, jobName);
                    }
                  }
                },
                color: green,
                width: Get.width,
                borderRadiusC: 10,
                child: Padding(
                  padding: paddingAll10,
                  child: Center(
                    child: KText(
                      text: 'Apply Now',
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
