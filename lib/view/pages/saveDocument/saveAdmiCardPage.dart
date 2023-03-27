import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/dialog/loadingDialog.dart';
import 'package:job_circular_app/service/snackbar/snackbar.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/img/customViewImage.dart';
import 'package:job_circular_app/view/widgets/pdfViewer/customPdfviewer.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';
import '../../../service/controllerService.dart';
import '../../../service/datetime/datetimeFormat.dart';

class SaveAdmitCardPage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    authC.getProfileInfo().then((_) {
      _.map((e) {
        authC.name.value.text = e.name ?? '';
        fileUploadC.selectedImage.value = e.image ?? '';
      }).toList();
    });

    return Scaffold(
      drawer: sidebarComponent(),
      appBar: cAppBar(title: 'Save Admit Card'),
      body: Padding(
        padding: paddingH10,
        child: ListView(
          children: [
            sizeH10,
            customCard(
              onTap: () => fileUploadC.pickFile(
                uploadCategory: 'Cv',
                // extensions: ['pdf'],
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
                              text: '[only .pdf, .jpg, .png format accepted.]',
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: black54,
                            ),
                          ],
                  ),
                ),
              ),
            ),
            sizeH10,
            Obx(
              () => fileUploadC.selectedFile.value == ''
                  ? Container()
                  : customCard(
                      onTap: () => saveDocumentC.addCv('AdmitCard'),
                      borderRadiusC: 10,
                      color: green,
                      height: 35,
                      child: Center(
                        child: KText(
                          text: 'Upload',
                          color: white,
                        ),
                      ),
                    ),
            ),
            sizeH10,
            KText(
              text: 'All Your File',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            sizeH10,
            StreamBuilder(
              stream: saveDocumentC.getSaveAdmitCard(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) {
                      print('Size: ${snapshot.data!.size}');
                      final item = snapshot.data!.docs[index].data();
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: customCard(
                          borderRadiusC: 5,
                          // height: 50,
                          child: Padding(
                            padding: paddingAll10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Icon(
                                    item['fileName']
                                                .toString()
                                                .contains('.jpg') ||
                                            item['fileName']
                                                .toString()
                                                .contains('.png')
                                        ? Icons.photo
                                        : Icons.picture_as_pdf,
                                    size: 30,
                                    color: red,
                                  ),
                                ),
                                sizeH5,
                                KText(
                                  text: '${index + 1}. ' + item['fileName'],
                                ),
                                sizeH10,
                                Row(
                                  children: [
                                    customCard(
                                      onTap: () => saveDocumentC
                                          .deleteSavedFile(item['id']),
                                      color: red,
                                      borderRadiusC: 10,
                                      child: Padding(
                                        padding: paddingAll5,
                                        child: Row(
                                          children: [
                                            KText(
                                              text: 'Delete',
                                              color: white,
                                            ),
                                            Icon(
                                              Icons.delete,
                                              size: 15,
                                              color: white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    customCard(
                                      onTap: () {
                                        if (item['fileName']
                                                .toString()
                                                .contains('.jpg') ||
                                            item['fileName']
                                                .toString()
                                                .contains('.png')) {
                                          Get.to(
                                            CustomViewImage(
                                              title: item['fileName'],
                                              imageUrl: item['file'],
                                            ),
                                          );
                                        }
                                        if (item['fileName']
                                            .toString()
                                            .contains('.pdf')) {
                                          Get.to(
                                            CustomPdfViewer(
                                              fileName: item['fileName'],
                                              pdfViewUrl: item['file'],
                                            ),
                                          );
                                        }
                                      },
                                      color: blue,
                                      borderRadiusC: 10,
                                      child: Padding(
                                        padding: paddingAll5,
                                        child: Row(
                                          children: [
                                            KText(
                                              text: 'View ',
                                              color: white,
                                            ),
                                            Icon(
                                              Icons.remove_red_eye,
                                              size: 15,
                                              color: white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    sizeW10,
                                    customCard(
                                      onTap: () async {
                                        loadingDialog(
                                            loadingText: 'Downloading...');
                                        File file =
                                            await saveDocumentC.downloadFile(
                                                item['file'], item['fileName']);

                                        if (file.path != '') {
                                          Get.back();
                                          print(
                                              'Downloaded file: ${file.path}');
                                          snackbar('File downloaded!!');
                                        } else {
                                          Get.back();

                                          snackbar('File downloading failed!!',
                                              bgColor: red);
                                        }
                                      },
                                      color: green,
                                      borderRadiusC: 10,
                                      child: Padding(
                                        padding: paddingAll5,
                                        child: Row(
                                          children: [
                                            KText(
                                              text: 'Download',
                                              color: white,
                                            ),
                                            Icon(
                                              Icons.download,
                                              size: 15,
                                              color: white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                sizeH10,
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundImage: item['profilePic'] == ''
                                          ? null
                                          : NetworkImage(
                                              item['profilePic'],
                                            ),
                                      child: item['profilePic'] != ''
                                          ? null
                                          : Icon(
                                              Icons.person,
                                              size: 15,
                                            ),
                                    ),
                                    sizeW10,
                                    KText(
                                      text: item['userName'],
                                      fontSize: 12,
                                    ),
                                    Spacer(),
                                    KText(
                                      text: datetimeFormat(
                                        item['time'],
                                      ),
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            sizeH10,
          ],
        ),
      ),
    );
  }
}
