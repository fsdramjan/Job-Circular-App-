// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/dialog/loadingDialog.dart';
import 'package:job_circular_app/view/components/drawer/sidebarComponent.dart';
import 'package:job_circular_app/view/pages/profile/jobProfile/addressPage.dart';
import 'package:job_circular_app/view/pages/profile/jobProfile/basicInfoPage.dart';
import 'package:job_circular_app/view/pages/profile/jobProfile/educationPage.dart';
import 'package:job_circular_app/view/pages/profile/jobProfile/skills/skillsPage.dart';
import 'package:job_circular_app/view/widgets/appBar/cAppBar.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/button/rowButtonProfile.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

import '../../../../service/snackbar/snackbar.dart';
import '../../../widgets/img/customViewImage.dart';

class JobProfilePage extends StatelessWidget with AllController {
  final allImages = RxList();

  addProfileImg(imgUrl) {
    if (allImages.contains(imgUrl.toString())) {
    } else {
      if (imgUrl != '') {
        allImages.add(imgUrl);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cAppBar(title: 'Job Profile'),
      drawer: sidebarComponent(),
      body: Padding(
        padding: paddingH10V10,
        child: ListView(
          children: [
            rowButtonProfile(
              onTap: () => Get.to(BasicInfoPage()),
              leadingText: 'Basic Info',
              rightIcon: Icons.edit_outlined,
            ),
            sizeH10,
            rowButtonProfile(
              onTap: () => Get.to(AddressPage()),
              leadingText: 'Address',
              rightIcon: Icons.edit_outlined,
            ),
            sizeH10,
            rowButtonProfile(
              onTap: () => Get.to(EducationPage()),
              leadingText: 'Education',
              rightIcon: Icons.edit_outlined,
            ),
            sizeH10,
            rowButtonProfile(
              onTap: () => Get.to(SkillsPage()),
              leadingText: 'Skills',
              rightIcon: Icons.edit_outlined,
            ),
            sizeH40,
            StreamBuilder(
              stream: jobProfileC.getImages(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var item = snapshot.data!.docs;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    allImages.clear();
                    jobProfileC.profile.text = item.first['profile'] ?? '';
                    jobProfileC.signature.text = item.first['signature'] ?? '';
                    jobProfileC.nid.text = item.first['nid'] ?? '';
                    jobProfileC.passport.text = item.first['passport'] ?? '';
                    jobProfileC.birthCertificate.text =
                        item.first['birthCertificate'] ?? '';
                    jobProfileC.certificate.text =
                        item.first['certificate'] ?? '';

                    addProfileImg(item.first['profile']);
                    addProfileImg(item.first['signature']);
                    addProfileImg(item.first['nid']);
                    addProfileImg(item.first['passport']);
                    addProfileImg(item.first['birthCertificate']);
                    addProfileImg(item.first['certificate']);
                  });

                  return Column(
                    children: [
                      rowButtonProfile(
                        leadingText: 'PP Photo',
                        rightIcon: Icons.camera_alt_outlined,
                        child: SizedBox(
                          width: 80,
                          child: rowButtonProfile(
                            onTap: () async {
                              fileUploadC.pickImage(
                                uploadCategory: 'jobProfilePic',
                              );
                              print(fileUploadC.selectedImage.value);
                              if (fileUploadC.selectedImage.value != '') {
                                jobProfileC.profile.text =
                                    fileUploadC.selectedImage.value;
                                await jobProfileC.addImages();
                                fileUploadC.selectedImage.value = '';
                              }
                            },
                            leadingText: 'Upload',
                            isCenterText: true,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      sizeH10,
                      rowButtonProfile(
                        leadingText: 'Signature',
                        rightIcon: Icons.camera_alt_outlined,
                        child: SizedBox(
                          width: 80,
                          child: rowButtonProfile(
                            onTap: () async {
                              fileUploadC.pickImage(
                                uploadCategory: 'jobProfilePic',
                              );
                              print(fileUploadC.selectedImage.value);
                              if (fileUploadC.selectedImage.value != '') {
                                jobProfileC.signature.text =
                                    fileUploadC.selectedImage.value;
                                await jobProfileC.addImages();
                                fileUploadC.selectedImage.value = '';
                              }
                            },
                            leadingText: 'Upload',
                            isCenterText: true,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      sizeH10,
                      rowButtonProfile(
                        leadingText: 'NID',
                        rightIcon: Icons.camera_alt_outlined,
                        child: SizedBox(
                          width: 80,
                          child: rowButtonProfile(
                            onTap: () async {
                              fileUploadC.pickImage(
                                uploadCategory: 'jobProfilePic',
                              );
                              print(fileUploadC.selectedImage.value);
                              if (fileUploadC.selectedImage.value != '') {
                                jobProfileC.nid.text =
                                    fileUploadC.selectedImage.value;
                                await jobProfileC.addImages();
                                fileUploadC.selectedImage.value = '';
                              }
                            },
                            leadingText: 'Upload',
                            isCenterText: true,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      sizeH10,
                      rowButtonProfile(
                        leadingText: 'Passport',
                        rightIcon: Icons.camera_alt_outlined,
                        child: SizedBox(
                          width: 80,
                          child: rowButtonProfile(
                            onTap: () async {
                              fileUploadC.pickImage(
                                uploadCategory: 'jobProfilePic',
                              );
                              print(fileUploadC.selectedImage.value);
                              if (fileUploadC.selectedImage.value != '') {
                                jobProfileC.passport.text =
                                    fileUploadC.selectedImage.value;
                                await jobProfileC.addImages();
                                fileUploadC.selectedImage.value = '';
                              }
                            },
                            leadingText: 'Upload',
                            isCenterText: true,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      sizeH10,
                      rowButtonProfile(
                        leadingText: 'Birth Certificate',
                        rightIcon: Icons.camera_alt_outlined,
                        child: SizedBox(
                          width: 80,
                          child: rowButtonProfile(
                            onTap: () async {
                              fileUploadC.pickImage(
                                uploadCategory: 'jobProfilePic',
                              );
                              print(fileUploadC.selectedImage.value);
                              if (fileUploadC.selectedImage.value != '') {
                                jobProfileC.birthCertificate.text =
                                    fileUploadC.selectedImage.value;
                                await jobProfileC.addImages();
                                fileUploadC.selectedImage.value = '';
                              }
                            },
                            leadingText: 'Upload',
                            isCenterText: true,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      sizeH40,
                      Container(
                        // color: red,
                        height: 45,
                        child: Row(
                          children: [
                            KText(
                              text: 'Certificate',
                              color: black54,
                              fontWeight: FontWeight.w600,
                            ),
                            sizeW20,
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(5),
                              child: SizedBox(
                                width: 60,
                                child: Column(
                                  children: [
                                    KText(
                                      text: 'J.S.C',
                                      color: green,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Icon(
                                      Icons.download,
                                      size: 20,
                                      color: green,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            iconButton(
                              onTap: () async {
                                fileUploadC.pickImage(
                                  uploadCategory: 'jobProfilePic',
                                );
                                print(fileUploadC.selectedImage.value);
                                if (fileUploadC.selectedImage.value != '') {
                                  jobProfileC.certificate.text =
                                      fileUploadC.selectedImage.value;
                                  await jobProfileC.addImages();
                                  fileUploadC.selectedImage.value = '';
                                }
                              },
                              icons: Icons.add_circle,
                              isHideCirleAvatar: true,
                              iconColor: green,
                            ),
                          ],
                        ),
                      ),
                      sizeH20,
                      Container(
                        height: 120,
                        child: Obx(
                          () => ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: allImages.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (c, i) {
                                final img = allImages[i];
                                return Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: 120,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      clipBehavior: Clip.none,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            img,
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 5,
                                          left: 5,
                                          child: KText(
                                            text: 'Photo',
                                            color: green,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        // Spacer(),
                                        Positioned(
                                          bottom: -5,
                                          child: Row(
                                            children: [
                                              iconButton(
                                                onTap: () => Get.to(
                                                  CustomViewImage(
                                                    imageUrl: img,
                                                    title: 'Image',
                                                  ),
                                                ),
                                                icons: Icons.remove_red_eye,
                                                iconColor: green,
                                                iconSize: 20,
                                                width: 50,
                                                isHideCirleAvatar: true,
                                              ),
                                              // Spacer(),
                                              iconButton(
                                                onTap: () async {
                                                  if (img != '') {
                                                    loadingDialog(
                                                        loadingText:
                                                            'Downloading...');
                                                    File file =
                                                        await saveDocumentC
                                                            .downloadFile(
                                                      img,
                                                      'image$i',
                                                    );

                                                    if (file.path != '') {
                                                      Get.back();
                                                      print(
                                                          'Downloaded file: ${file.path}');
                                                      snackbar(
                                                          'File downloaded!!');
                                                    } else {
                                                      Get.back();

                                                      snackbar(
                                                        'File downloading failed!!',
                                                        bgColor: red,
                                                      );
                                                    }
                                                  }
                                                },
                                                icons: Icons.download,
                                                iconColor: green,
                                                iconSize: 20,
                                                width: 50,
                                                isHideCirleAvatar: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
